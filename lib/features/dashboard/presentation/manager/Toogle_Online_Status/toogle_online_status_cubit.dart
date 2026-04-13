import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:guide_me/features/dashboard/domain/repo/toggle_online_repository%20.dart';
import 'package:injectable/injectable.dart';

part 'toogle_online_status_state.dart';

@injectable
class ToogleOnlineStatusCubit extends Cubit<ToogleOnlineStatusState> {
  final SocketManager _socketManager;
  final ToggleOnlineRepository _repository; 

  ToogleOnlineStatusCubit(this._socketManager, this._repository)
      : super(ToogleOnlineStatusInitial());

  void safeEmit(ToogleOnlineStatusState state) {
    if (!isClosed) emit(state);
  }

  bool isOnline = false;

  Future<void> toogleOnlineStatus(bool status, String token) async {
    safeEmit(ToogleOnlineStatusLoading());

    final result = await _repository.toggleOnline(status);

    result.fold(
      (failure) {
        isOnline = !status; 
        safeEmit(ToogleOnlineStatusError(failure.message.toString()));
      },
      (successModel) {
        isOnline = status;
        if (isOnline) {
          // _socketManager.connect(token);
        } else {
          // _socketManager.dispose();
        }
        safeEmit(ToogleOnlineStatusChanged(isOnline));
      },
    );
  }
}
