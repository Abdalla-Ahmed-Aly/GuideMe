import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/request_model%20.dart';
import 'package:guide_me/features/dashboard/domain/use_case/get_requests_history_use_case.dart';
import 'package:guide_me/features/dashboard/domain/use_case/listen_to_incoming_requests_use_case.dart';

part 'dashboard_cubit_state.dart';

class DashboardCubitCubit extends Cubit<DashboardCubitState> {
  final GetRequestsHistoryUseCase getRequestsHistoryUseCase;
  final ListenToIncomingRequestsUseCase listenToIncomingRequestsUseCase;
  DashboardCubitCubit(
    this.getRequestsHistoryUseCase,
    this.listenToIncomingRequestsUseCase,
  ) : super(DashboardCubitInitial());
  StreamSubscription? streamSubscription;

  Future<void> getRequestsHistory() async {
    emit(DashboardCubitLoading());
    final result = await getRequestsHistoryUseCase();
    result.fold(
      (failure) => emit(DashboardCubitFailure(failure)),
      (requestsHistory) => emit(DashboardCubitSuccess(requestsHistory)),
    );
  }
}
