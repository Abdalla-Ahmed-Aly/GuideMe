import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/use_cases/clear_cached_user_usecase.dart';
import 'package:guide_me/core/shared/use_cases/fetch_remote_user_usecase.dart';
import 'package:guide_me/core/shared/use_cases/get_cached_user_usecase.dart';
import 'package:guide_me/core/shared/use_cases/update_cached_user_usecase.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._getCachedUserUsecase,
    this._clearCachedUserUsecase,
    this._updateCachedUserUsecase,
    this._fetchRemoteUserUsecase,
  ) : super(UserInitial());
  final GetCachedUserUsecase _getCachedUserUsecase;
  final UpdateCachedUserUsecase _updateCachedUserUsecase;
  final ClearCachedUserUsecase _clearCachedUserUsecase;
  final FetchRemoteUserUsecase _fetchRemoteUserUsecase;

  void safeEmit(UserState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  void loadUser() {
    final result = _getCachedUserUsecase.call();
    result.fold(
      (failure) => safeEmit(UserFailure(failure)),
      (user) =>
          (user == null) ? safeEmit(UserFailure(null)) : safeEmit(UserSuccess(user)),
    );
  }

  /// Fetches fresh user data from the server, caches it, and emits [UserSuccess].
  Future<void> fetchRemoteUser() async {
    safeEmit(UserLoading());
    final result = await _fetchRemoteUserUsecase.call();
    await result.fold(
      (failure) async => safeEmit(UserFailure(failure)),
      (user) async {
        await _updateCachedUserUsecase.call(user);
        safeEmit(UserSuccess(user));
      },
    );
  }

  Future<void> updateUser(UserEntity user) async {
    final result = await _updateCachedUserUsecase.call(user);
    result.fold(
      (failure) => safeEmit(UserFailure(failure)),
      (_) => safeEmit(UserSuccess(user)),
    );
  }

  Future<void> clearUser() async {
    final result = await _clearCachedUserUsecase.call();
    result.fold(
      (failure) => safeEmit(UserFailure(failure)),
      (_) => safeEmit(UserInitial()),
    );
  }
}

