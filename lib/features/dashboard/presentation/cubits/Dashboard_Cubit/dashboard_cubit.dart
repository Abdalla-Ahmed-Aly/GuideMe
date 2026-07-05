import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/dashboard/data/mappers/request_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/request_model.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/use_case/get_requests_history_use_case.dart';

part 'dashboard_cubit_state.dart';

class DashboardCubit extends Cubit<DashboardCubitState> {
  final GetRequestsHistoryUseCase getRequestsHistoryUseCase;
  final SocketEventBus _socketEventBus;

  DashboardCubit(
    this.getRequestsHistoryUseCase,
    this._socketEventBus,
  ) : super(DashboardCubitInitial()) {
    _listeningToNewBooking();
    _listenToBookingTaken();
  }

  StreamSubscription? _newBookingSubscription;
  StreamSubscription? _bookingTakenSubscription;
  List<RequestEntity> requests = [];

  void safeEmit(DashboardCubitState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getRequestsHistory() async {
    safeEmit(DashboardCubitLoading());

    _listeningToNewBooking();
    _listenToBookingTaken();

    final result = await getRequestsHistoryUseCase();

    result.fold(
      (failure) {
        safeEmit(DashboardCubitFailure(failure));
      },
      (requestsHistory) {
        requests = requestsHistory;
        safeEmit(DashboardCubitSuccess(requests));
      },
    );
  }

  void _listeningToNewBooking() {
    _newBookingSubscription?.cancel();

    _newBookingSubscription = _socketEventBus
        .listenTo(SocketAppEvents.newBooking.value)
        .listen((data) {
          final Map<String, dynamic> json = data is String
              ? jsonDecode(data)
              : data as Map<String, dynamic>;

          final requestModel = RequestModel.fromJson(json['data']);

          _updateNewRequests(RequestMapper.toEntity(requestModel));
        });
  }

  void _updateNewRequests(RequestEntity requestEntity) {
    requests.insert(0, requestEntity);
    safeEmit(DashboardCubitSuccess(List.from(requests)));
  }

  void _listenToBookingTaken() {
    _bookingTakenSubscription?.cancel();

    _bookingTakenSubscription = _socketEventBus
        .listenTo(SocketAppEvents.bookingTaken.value)
        .listen(
          (data) {
            final Map<String, dynamic> json = data is String
                ? jsonDecode(data)
                : data as Map<String, dynamic>;

            final String type = json['type'];
            final String id = json['id'];

            if (type == 'single') {
              removeBookingFromList(id);
            } else if (type == 'package') {
              removePackageFromList(id);
            }
          },
        );
  }

  void removeBookingFromList(String id) {
    requests.removeWhere(
      (r) => r.booking?.id == id,
    );
    safeEmit(DashboardCubitSuccess(List.from(requests)));
  }

  void removePackageFromList(String id) {
    requests.removeWhere(
      (r) => r.packageId == id,
    );
    safeEmit(DashboardCubitSuccess(List.from(requests)));
  }

  void resetToInitial() {
    _newBookingSubscription?.cancel();
    _newBookingSubscription = null;
    _bookingTakenSubscription?.cancel();
    _bookingTakenSubscription = null;
    requests = [];
    safeEmit(DashboardCubitInitial());
  }

  @override
  Future<void> close() {
    _newBookingSubscription?.cancel();
    _bookingTakenSubscription?.cancel();
    _newBookingSubscription = null;
    _bookingTakenSubscription = null;
    return super.close();
  }
}
