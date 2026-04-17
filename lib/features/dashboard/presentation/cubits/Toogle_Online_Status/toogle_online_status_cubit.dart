import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:guide_me/features/dashboard/domain/repo/toggle_online_repository%20.dart';
import 'package:injectable/injectable.dart';

part 'toogle_online_status_state.dart';

@injectable
class ToggleOnlineStatusCubit extends Cubit<ToogleOnlineStatusState> {
  final ToggleOnlineRepository _repository;

  ToggleOnlineStatusCubit(this._repository)
    : super(ToogleOnlineStatusInitial());

  bool isOnline = false;

  void safeEmit(ToogleOnlineStatusState state) {
    if (!isClosed) emit(state);
  }

  Future<void> loadInitialStatus() async {
    isOnline =
        HiveHelper.get<bool>(
          boxName: HiveConstants.onlineStatusBox,
          key: HiveConstants.onlineStatusKey,
        ) ??
        false;
    safeEmit(ToogleOnlineStatusChanged(isOnline));
  }

  Future<void> toogleOnlineStatus(bool status, String token) async {
    safeEmit(ToogleOnlineStatusLoading());
    final result = await _repository.toggleOnline(status);
    result.fold(
      (failure) {
        isOnline = !status;
        safeEmit(ToogleOnlineStatusError(failure.message.toString()));
      },
      (successModel) async {
        isOnline = status;
        await HiveHelper.put<bool>(
          boxName: HiveConstants.onlineStatusBox,
          key: HiveConstants.onlineStatusKey,
          data: isOnline,
        );
        safeEmit(ToogleOnlineStatusChanged(isOnline));
      },
    );
  }
}
