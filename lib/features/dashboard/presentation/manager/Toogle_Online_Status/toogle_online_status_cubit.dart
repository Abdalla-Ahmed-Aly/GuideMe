import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:injectable/injectable.dart';

part 'toogle_online_status_state.dart';

@injectable
class ToogleOnlineStatusCubit extends Cubit<ToogleOnlineStatusState> {
  final SocketManager _socketManager;
  ToogleOnlineStatusCubit(this._socketManager)
    : super(ToogleOnlineStatusInitial());
  void safeEmit(ToogleOnlineStatusState state) {
    if (!isClosed) emit(state);
  }

  bool isOnline = false;
  void toogleOnlineStatus(bool status, String token) {
    try {
  isOnline = status;
  if (isOnline) {
    _socketManager.connect(token);
    safeEmit(ToogleOnlineStatusChanged(true));
  } else {
    _socketManager.dispose();
    safeEmit(ToogleOnlineStatusChanged(false));
  }
}  catch (e) {
  isOnline = !status;
  safeEmit(ToogleOnlineStatusError("Failed to change online status: ${e.toString()}"));
}
  }
}
