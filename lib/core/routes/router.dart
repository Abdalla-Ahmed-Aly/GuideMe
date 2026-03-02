import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/services/media_picker_service/media_picker_service_impl.dart';
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
import 'package:guide_me/features/booking/presentation/screens/accepted_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/booking_details_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/panding_approval_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/reservation_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/booking_confirmation_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/filter_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/guide_profile_screen.dart';
import 'package:guide_me/features/chat/presentation/screens/chat_screen.dart';
import 'package:guide_me/features/chat/presentation/screens/tracking_screen.dart';
import 'package:guide_me/features/dashboard/presentation/cubit/guide_navigation_bar_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/screens/booking_request_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/guide_navigation_bar_screen.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/professional_info_cubit/professional_info_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/select_guide_cities_cubit/select_guide_cities_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/spoken_languages_cubit/spoken_languages_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/work_hours_cubit/work_hours_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/screens/guide_availability_and_pricing_screen.dart';
import 'package:guide_me/features/guide_registration/presentation/screens/guide_expertise_screen.dart';
import 'package:guide_me/features/guide_registration/presentation/screens/guide_professional_info_screen.dart';
import 'package:guide_me/features/guide_registration/presentation/screens/guide_verification_screen.dart';
import 'package:guide_me/features/guide_registration/presentation/screens/guide_verification_success_screen.dart';
import 'package:guide_me/features/guide_registration/presentation/screens/verification_failed_screen.dart';
import 'package:guide_me/features/home/presentation/screens/explore_places_screen.dart';
import 'package:guide_me/features/home/presentation/screens/tourist_navigation_bar_screen.dart';
import 'package:guide_me/features/home/presentation/screens/place_details_screen.dart';
import 'package:guide_me/features/home/presentation/screens/select_Interests_screen.dart';
import 'package:guide_me/features/profile/presentation/screens/add_payment_method_screen.dart';
import 'package:guide_me/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:guide_me/features/profile/presentation/screens/settings_screen.dart';
import 'package:guide_me/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:guide_me/features/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppRoutes.guideNavigationBarScreen,
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
        path: AppRoutes.touristNavigationBarScreen,
        builder: (context, state) => const TouristNavigationBarScreen(),
      ),
      GoRoute(
        path: AppRoutes.filterScreen,
        builder: (context, state) => const FilterScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookScreen,
        builder: (context, state) => const ReservationScreen(),
      ),
      GoRoute(
        path: AppRoutes.guideProfileScreen,
        builder: (context, state) => const GuideProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.selectInterestsScreen,
        builder: (context, state) => const SelectInterestsScreen(),
      ),
      GoRoute(
        path: AppRoutes.explorePlacesScreen,
        builder: (context, state) {
          final String title = state.extra as String;
          return ExplorePlacesScreen(title: title);
        },
      ),
      GoRoute(
        path: AppRoutes.placeDetailsScreen,
        builder: (context, state) => const PlaceDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookingDetailsScreen,
        builder: (context, state) => const BookingDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.addPaymentMethodScreen,
        builder: (context, state) => const AddPaymentMethodScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookingConfirmationScreen,
        builder: (context, state) => const BookingConfirmationScreen(),
      ),
      GoRoute(
        path: AppRoutes.pendingApprovalScreen,
        builder: (context, state) => const PandingApprovalScreen(),
      ),
      GoRoute(
        path: AppRoutes.acceptedScreen,
        builder: (context, state) => const AcceptedScreen(),
      ),
      GoRoute(
        path: AppRoutes.guideNavigationBarScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => GuideNavigationBarCubit(),
          child: const GuideNavigationBarScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.bookingRequestScreen,
        builder: (context, state) => const BookingRequestScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.guideProfessionalInfoScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfessionalInfoCubit(MediaPickerServiceImpl()),
          child: const GuideProfessionalInfoScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.guideExpertiseScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SpokenLanguagesCubit(),
          child: const GuideExpertiseScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.guideAvailabilityAndPricingScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SelectGuideCitiesCubit(),
            ),
            BlocProvider(
              create: (context) => WorkHoursCubit(),
            ),
          ],
          child: const GuideAvailabilityAndPricingScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.guideVerificationScreen,
        builder: (context, state) => const GuideVerificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.verificationFailedScreen,
        builder: (context, state) => const VerificationFailedScreen(),
      ),
      GoRoute(
        path: AppRoutes.guideVerificationSuccessScreen,
        builder: (context, state) => const GuideVerificationSuccessScreen(),
      ),
      GoRoute(
        path: AppRoutes.chatScreen,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: AppRoutes.trackingScreen,
        builder: (context, state) => const TrackingScreen(),
      ),
    ],
  );
}
