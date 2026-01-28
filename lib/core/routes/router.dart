import 'package:go_router/go_router.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/create_account_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/log_in_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/signup_and_login_screen.dart';
import 'package:guide_me/features/auth/presentation/screens/sucess_password_screen.dart';

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
        builder: (context, state) => const CheckEmailScreen(),
      ),

      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        builder: (context, state) => const ResetPasswordScreen(),
      ),

      GoRoute(
        path: AppRoutes.successPasswordScreen,
        builder: (context, state) => const SucessPasswordScreen(),
      ),
      

    ],
  );
}
