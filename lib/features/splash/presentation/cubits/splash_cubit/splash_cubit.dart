import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._tokenService) : super(SplashInitial());
  final TokenService _tokenService;

  void checkAuth() async {
    final token = await _tokenService.getToken();
    final userRole = HiveHelper.get<UserRole>(
      boxName: HiveConstants.userRoleBox,
      key: HiveConstants.userRoleKey,
    );

    if (token != null && userRole != null) {
      emit(SplashAuthenticated(userRole: userRole));
    } else {
      emit(SplashUnAuthenticated());
    }
  }
}
