import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/use_case/get_requests_history_use_case.dart';
import 'package:guide_me/features/dashboard/domain/use_case/listen_to_incoming_requests_use_case.dart';

part 'dashboard_cubit_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardCubitState> {
  final GetRequestsHistoryUseCase getRequestsHistoryUseCase;
  final ListenToIncomingRequestsUseCase listenToIncomingRequestsUseCase;

  DashboardCubit(
    this.getRequestsHistoryUseCase,
    this.listenToIncomingRequestsUseCase,
  ) : super(DashboardCubitInitial());

  StreamSubscription? _streamSubscription;
  List<RequestCardEntity> _requests = [];

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
        // final allCombined = [..._requests, ...requestsHistory];

        // final distinctIds = <String>{};
        // _requests = allCombined
        //     .where((req) => distinctIds.add(req.bookingid))
        //     .toList();
          _requests = requestsHistory;
        safeEmit(DashboardCubitSuccess(_requests));
      },
    );
  }

  void _startListening() {
    print("🔥 START LISTENING");
    if (_streamSubscription != null) return;

    _streamSubscription =
        listenToIncomingRequestsUseCase().listen((either) {
      either.fold(
        (failure) {
        
        },
        (newRequest) {
          _requests = [newRequest, ..._requests];

          safeEmit(DashboardCubitSuccess(_requests));
        },
      );
    });
  }

  void resetToInitial() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _requests = [];
    safeEmit(DashboardCubitInitial());
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
  void removeRequestLocally(String bookingId) {
  _requests.removeWhere((req) => req.bookingid == bookingId);
  
  safeEmit(DashboardCubitSuccess(List.from(_requests)));
}
}