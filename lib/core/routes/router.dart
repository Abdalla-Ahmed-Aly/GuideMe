import 'package:go_router/go_router.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/features/auth/presentation/screens/allow_location_access_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/choose_nationality_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/choose_role_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/create_account_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/log_in_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/signup_and_login_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/sucess_password_screen.dart';
import 'package:guide_me/features/home/presentation/screens/explore_places_screen.dart';
import 'package:guide_me/features/home/presentation/screens/main_navigation_screen.dart';
import 'package:guide_me/features/home/presentation/screens/select_Interests_screen.dart';
import 'package:guide_me/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:guide_me/features/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter {
  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.signupAndLoginScreen,
        builder: (context, state) => const SignupAndLoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.createAccountScreen,
        builder: (context, state) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: AppRoutes.logInScreen,
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.checkemailscreen,
        builder: (context, state) => const VerificationCodeScreen(),
      ),
      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.successPasswordScreen,
        builder: (context, state) => const SucessPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.chooseNationalityScreen,
        builder: (context, state) => const ChooseNationalityScreen(),
      ),
      GoRoute(
        path: AppRoutes.allowLocationAccessScreen,
        builder: (context, state) => const AllowLocationAccessScreen(),
      ),
      GoRoute(
        path: AppRoutes.chooseRoleScreen,
        builder: (context, state) => const ChooseRoleScreen(),
      ),
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainNavigationScreen,
        builder: (context, state) {
          return const MainNavigationScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.selectInterestsScreen,
        builder: (context, state) => const SelectInterestsScreen(),
      ),
      GoRoute(
        path: AppRoutes.explorePlacesScreen,
        builder: (context, state) => const ExplorePlacesScreen(),
      ),
    ],
  );
}
