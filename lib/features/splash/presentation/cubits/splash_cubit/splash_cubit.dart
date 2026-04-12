import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:guide_me/features/guide_registration/data/repositories/guide_registration_repository.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._tokenService) : super(SplashInitial());
  final TokenService _tokenService;

  void checkAuth() async {
    final repository = getIt<GuideRegistrationRepository>();
    final token = await _tokenService.getToken();
    final userRole = HiveHelper.get<UserRole>(
      boxName: HiveConstants.userRoleBox,
      key: HiveConstants.userRoleKey,
    );

    if (token != null && userRole != null) {
      if (userRole == UserRole.tourist) {
        emit(SplashAuthenticated(userRole: userRole));
        return;
      }

      // Logic for Guides
      try {
        final response = await repository.getVerificationStatus();
        final data = response.data['data'];
        final status = data['status']; // "not-submitted", "pending", "approved", "rejected"
        
        if (status == 'not-submitted') {
          final signupStep = HiveHelper.get<String>(
            boxName: HiveConstants.signupProgressBox,
            key: HiveConstants.signupStepKey,
          );

          if (signupStep == 'need-nationality') {
            emit(SplashNeedNationality());
          } else if (signupStep == 'need-location') {
            emit(SplashNeedLocation());
          } else {
            emit(SplashGuideOnboardingNotSubmitted());
          }
        } else if (status == 'pending') {
          emit(SplashGuideOnboardingPending());
        } else if (status == 'approve' || status == 'approved') {
          emit(SplashGuideOnboardingApproved());
        } else if (status == 'rejected') {
          emit(SplashGuideOnboardingRejected(data['message'] ?? 'Rejected'));
        } else {
          emit(SplashAuthenticated(userRole: userRole));
        }
      } catch (_) {
        emit(SplashAuthenticated(userRole: userRole));
      }
    } else {
      emit(SplashUnAuthenticated());
    }
  }
}
