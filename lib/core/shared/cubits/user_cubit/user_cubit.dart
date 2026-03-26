import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/use_cases/clear_cached_user_usecase.dart';
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
  ) : super(UserInitial());
  final GetCachedUserUsecase _getCachedUserUsecase;
  final UpdateCachedUserUsecase _updateCachedUserUsecase;
  final ClearCachedUserUsecase _clearCachedUserUsecase;

  void loadUser() {
    final result = _getCachedUserUsecase.call();
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (user) =>
          (user == null) ? emit(UserFailure(null)) : emit(UserSuccess(user)),
    );
  }

  Future<void> updateUser(UserEntity user) async {
    final result = await _updateCachedUserUsecase.call(user);
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (_) => emit(UserSuccess(user)),
    );
  }

  Future<void> clearUser() async {
    final result = await _clearCachedUserUsecase.call();
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (_) => emit(UserInitial()),
    );
  }
}
