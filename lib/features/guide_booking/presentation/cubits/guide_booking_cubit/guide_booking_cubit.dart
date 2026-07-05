import 'dart:async';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/booking/data/mappers/booking_mapper.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/domain/enums/guide_booking_status.dart';
import 'package:guide_me/features/guide_booking/domain/use_cases/get_guide_booking_use_case.dart';
import 'package:guide_me/features/guide_booking/domain/use_cases/guide_booking_filter_use_case.dart';

part 'guide_booking_state.dart';

class GuideBookingCubit extends Cubit<GuideBookingState> {
  GuideBookingCubit(
    this._bookingsUseCase,
    this._guideBookingFilterUseCase,
    this._socketEventBus,
  ) : super(GuideBookingInitial()) {
    _listenToNewBooking();
    _listenToUpdateBooking();
  }
  final GetGuideBookingUseCase _bookingsUseCase;
  final GuideBookingFilterUseCase _guideBookingFilterUseCase;
  final SocketEventBus _socketEventBus;

  StreamSubscription? _subscription;
  StreamSubscription? _updateSubscription;

  void safeEmit(GuideBookingState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getGuideBookings() async {
    safeEmit(GuideBookingLoading(filters: state.filters));

    final result = await _bookingsUseCase.call(
      date: state.filters.selectedDate,
      status: state.filters.guideBookingStatus.name,
    );

    result.fold(
      (failure) {
        if (failure.failureCode == FailureCode.cancelled) return;
        safeEmit(
          GuideBookingFailure(failure: failure, filters: state.filters),
        );
      },
      (bookings) {
        final newFilters = state.filters.copyWith(guideBookings: bookings);
        final filteredBookings = _guideBookingFilterUseCase.filter(
          bookings: bookings,
          status: newFilters.guideBookingStatus,
        );
        safeEmit(
          GuideBookingSuccess(
            guideBookings: filteredBookings,
            filters: newFilters,
          ),
        );
      },
    );
  }

  void _listenToNewBooking() {
    _subscription?.cancel();

    _subscription = _socketEventBus.listenTo(SocketAppEvents.bookingAccepted.value).listen((data) {
      final Map<String, dynamic> json = data is String
          ? jsonDecode(data)
          : data as Map<String, dynamic>;

      final booking = BookingModel.fromJson(
        json['booking'] as Map<String, dynamic>,
      );
      _addNewBooking(BookingMapper.toEntity(booking));
    });
  }

  void _addNewBooking(BookingEntity booking) {
    final updatedList = [booking, ...state.filters.guideBookings];
    final newFilters = state.filters.copyWith(guideBookings: updatedList);
    final filtered = _guideBookingFilterUseCase.filter(
      bookings: updatedList,
      status: newFilters.guideBookingStatus,
    );
    safeEmit(
      GuideBookingSuccess(
        guideBookings: filtered,
        filters: newFilters,
      ),
    );
  }

  void _listenToUpdateBooking() {
    _updateSubscription?.cancel();

    final events = [
      SocketAppEvents.bookingLive.value,
      SocketAppEvents.bookingCompleted.value,
    ];

    _updateSubscription =
        StreamGroup.merge(
          events.map((event) => _socketEventBus.listenTo(event)),
        ).listen((data) {
          final Map<String, dynamic> json = data is String
              ? jsonDecode(data)
              : data as Map<String, dynamic>;

          final booking = BookingModel.fromJson(
            json['booking'] as Map<String, dynamic>,
          );

          _updateBookingInList(BookingMapper.toEntity(booking));
        });
  }

  void _updateBookingInList(BookingEntity updated) {
    final updatedList = state.filters.guideBookings
        .map((b) => b.id == updated.id ? updated : b)
        .toList();

    final newFilters = state.filters.copyWith(guideBookings: updatedList);

    final filtered = _guideBookingFilterUseCase.filter(
      bookings: updatedList,
      status: newFilters.guideBookingStatus,
    );

    safeEmit(
      GuideBookingSuccess(
        guideBookings: filtered,
        filters: newFilters,
      ),
    );
  }

  void changeGuideBookingStatus(GuideBookingStatus status) {
    final filteredBookings = _guideBookingFilterUseCase.filter(
      bookings: state.filters.guideBookings,
      status: status,
    );
    safeEmit(
      GuideBookingSuccess(
        guideBookings: filteredBookings,
        filters: state.filters.copyWith(guideBookingStatus: status),
      ),
    );
  }

  void changeDate(DateTime? date) {
    final filters = date == null
        ? state.filters.copyWith(clearDate: true)
        : state.filters.copyWith(selectedDate: date);
    safeEmit(state.copyWith(filters: filters));
    getGuideBookings();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _updateSubscription?.cancel();
    _subscription = null;
    _updateSubscription = null;
    return super.close();
  }
}
