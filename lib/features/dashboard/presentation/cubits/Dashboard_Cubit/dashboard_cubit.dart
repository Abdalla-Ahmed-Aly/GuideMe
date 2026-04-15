import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/dashboard/data/mappers/request_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/use_case/get_requests_history_use_case.dart';

part 'dashboard_cubit_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardCubitState> {
  final GetRequestsHistoryUseCase getRequestsHistoryUseCase;
  final SocketEventBus _socketEventBus;

  DashboardCubit(
    this.getRequestsHistoryUseCase,
    this._socketEventBus,
  ) : super(DashboardCubitInitial());

  StreamSubscription? _streamSubscription;
  List<RequestEntity> requests = [];

  void safeEmit(DashboardCubitState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getRequestsHistory() async {
    safeEmit(DashboardCubitLoading());

    _startListening();

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

  void _startListening() {
    _streamSubscription?.cancel();

    _streamSubscription = _socketEventBus
        .listenTo(SocketAppEvents.newBooking.value)
        .listen((data) {
          final Map<String, dynamic> json = data is String
              ? jsonDecode(data)
              : data as Map<String, dynamic>;

          final requests = json['data']['requests'] as List<dynamic>;
          final requestsModels = requests
              .map((e) => RequestModel.fromJson(e))
              .toList();

          final requestsEntities = requestsModels
              .map((e) => RequestMapper.toEntity(e))
              .toList();

          this.requests = requestsEntities;

          safeEmit(DashboardCubitSuccess(requestsEntities));
        });
  }

  void resetToInitial() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    requests = [];
    safeEmit(DashboardCubitInitial());
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void removeRequestLocally(String bookingId) {
    requests.removeWhere((req) => req.booking?.id == bookingId);

    safeEmit(DashboardCubitSuccess(List.from(requests)));
  }
}
