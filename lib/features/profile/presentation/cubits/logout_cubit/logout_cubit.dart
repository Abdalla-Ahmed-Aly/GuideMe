import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:guide_me/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

part 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._profileRepo) : super(LogoutInitial());
  final ProfileRepo _profileRepo;

  void safeEmit(LogoutState state) {
    if (!isClosed) emit(state);
  }

  Future<void> logout() async {
    safeEmit(LogoutLoading());
    final result = await _profileRepo.logout();
    result.fold(
      (failure) {
        safeEmit(LogoutFailure(failure));
      },
      (_) async {
        await _deleteCachedData();

        safeEmit(LogoutSuccess());
      },
    );
  }

  Future<void> _deleteCachedData() async {
    
    await getIt<TokenService>().deleteToken();
    
    await HiveHelper.put<bool>(
      boxName: HiveConstants.avatarBox,
      key: HiveConstants.avatarKey,
      data: false,
    );
    await HiveHelper.delete<UserRole>(
      boxName: HiveConstants.userRoleBox,
      key: HiveConstants.userRoleKey,
    );
    await HiveHelper.delete<String>(
      boxName: HiveConstants.userBox,
      key: HiveConstants.userKey,
    );
    
    await HiveHelper.clearBox<Map>(
      name: HiveConstants.favoritesBox,
    );
  }
}
