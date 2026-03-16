import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:guide_me/features/booking/domain/use_cases/get_bookings_use_case.dart';
import 'package:injectable/injectable.dart';

part 'tourist_booking_state.dart';

@injectable
class TouristBookingCubit extends Cubit<TouristBookingState> {
  TouristBookingCubit(this._bookingsUseCase) : super(TouristBookingInitial());
  final GetBookingsUseCase _bookingsUseCase;

  Future<void> getBookings() async {
    safeEmit(TouristBookingLoading(filters: state.filters));

    final result = await _bookingsUseCase.call(
      date: state.filters.selectedDate,
      status: state.filters.touristBookingStatus,
    );

    result.fold(
      (failure) {
        if (failure.failureCode == FailureCode.cancelled) return;
        safeEmit(
          TouristBookingFailure(failure: failure, filters: state.filters),
        );
      },
      (bookings) => safeEmit(
        TouristBookingSuccess(
          touristBookings: bookings,
          filters: state.filters,
        ),
      ),
    );
  }

  void changeTouristBookingStatus(TouristBookingStatus status) {
    final update = state.filters.copyWith(touristTirpStatus: status);

    safeEmit(TouristBookingLoading(filters: update));

    getBookings();
  }

  void changeDate(DateTime? date) {
    final update = date == null
        ? state.filters.copyWith(clearDate: true)
        : state.filters.copyWith(selectedDate: date);

    safeEmit(TouristBookingLoading(filters: update));

    getBookings();
  }

  void safeEmit(TouristBookingState newState) {
    if (!isClosed) emit(newState);
  }
}
