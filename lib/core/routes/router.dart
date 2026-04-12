import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/shared/entities/guider_entity.dart';
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:guide_me/core/location_core/presentation/screens/pick_location_screen.dart';
import 'package:guide_me/core/location_core/presentation/screens/view_location_screen.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/services/media_picker_service/media_picker_service_impl.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/features/auth/presentation/manager/location_access_cubit/location_access_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/select_nationality_cubit/select_nationality_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/resend_forget_password_cubit/resend_forget_password_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/send_forget_password/send_forget_password_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/verify_password_cubit/verify_password_cubit.dart';
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
import 'package:guide_me/features/booking/presentation/cubits/add_booking_cubit/add_booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_ai_package_cubit/book_ai_package_cubit.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart';
import 'package:guide_me/features/booking/presentation/cubits/cancel_booking_cubit/cancel_booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';
import 'package:guide_me/features/booking/presentation/cubits/guide_data_cubit/guide_data_cubit.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:guide_me/features/booking/presentation/screens/accepted_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/book_ai_package_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/book_package_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/trip_details_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/package_booking_success_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/package_details_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/package_place_details_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/panding_approval_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/reservation_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/booking_confirmation_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/filter_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/guide_profile_screen.dart';
import 'package:guide_me/features/booking/presentation/screens/suggested_packages_screen.dart';
import 'package:guide_me/features/chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:guide_me/features/chat/presentation/screens/chat_screen.dart';
import 'package:guide_me/features/chat/presentation/screens/tracking_screen.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/cubit/guide_navigation_bar_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/manager/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/screens/booking_request_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/guide_navigation_bar_screen.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart';
import 'package:guide_me/features/guide_profile/presentation/screens/add_certification_screen.dart';
import 'package:guide_me/features/guide_profile/presentation/screens/tour_guide_profile_screen.dart';
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
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/presentation/cubits/interests_cubit/interests_cubit.dart';
import 'package:guide_me/features/home/presentation/screens/ai_package_places_screen.dart';
import 'package:guide_me/features/home/presentation/screens/explore_places_screen.dart';
import 'package:guide_me/features/home/presentation/screens/tourist_navigation_bar_screen.dart';
import 'package:guide_me/features/home/presentation/screens/place_details_screen.dart';
import 'package:guide_me/features/home/presentation/screens/select_Interests_screen.dart';
import 'package:guide_me/features/profile/presentation/cubits/cubit/update_profile_cubit.dart';
import 'package:guide_me/features/profile/presentation/screens/add_payment_method_screen.dart';
import 'package:guide_me/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:guide_me/features/profile/presentation/screens/settings_screen.dart';
import 'package:guide_me/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:guide_me/features/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter {
  static final appRouter = GoRouter(
    // initialLocation: AppRoutes.guideNavigationBarScreen,
    routes: [
      GoRoute(
        path: AppRoutes.signupAndLoginScreen,
        builder: (context, state) => const SignupAndLoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.createAccountScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const CreateAccountScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.logInScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<LoginwithGoogleCubit>(),
              ),
            ],
            child: const LogInScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SendForgetPasswordCubit>(),
          child: const ForgetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.checkemailscreen,
        builder: (context, state) {
          final email = state.extra as String;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<VerifyPasswordCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ResendForgetPasswordCubit>(),
              ),
            ],
            child: VerificationCodeScreen(email: email),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, String>;
          final email = data["email"]!;
          final otp = data["forgotPasswordOTP"]!;
          return BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPasswordScreen(
              email: email,
              otp: otp,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.successPasswordScreen,
        builder: (context, state) => const SucessPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.chooseNationalityScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SelectNationalityCubit>(),
          child: const ChooseNationalityScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.allowLocationAccessScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LocationAccessCubit>(),
          child: const AllowLocationAccessScreen(),
        ),
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<FilterCubit>()..getCities(),
          child: const FilterScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.bookScreen,
        builder: (context, state) {
          final place = state.extra as PlaceEntity;
          return BlocProvider(
            create: (context) =>
                getIt<ReservationCubit>()..setPlaceId(place.id),
            child: const ReservationScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.guideProfileScreen,
        builder: (context, state) {
          final GuiderEntity guider = state.extra as GuiderEntity;
          return BlocProvider(
            create: (context) =>
                getIt<GuideDataCubit>()..getGuideData(guideId: guider.id),
            child: const GuideProfileScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.selectInterestsScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<InterestsCubit>()..fetchCategories(),
          child: const SelectInterestsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.explorePlacesScreen,
        builder: (context, state) {
          final String title = state.extra as String;
          return ExplorePlacesScreen(title: title);
        },
      ),
      GoRoute(
        path: "${AppRoutes.explorePlacesScreen}/:categoryId",
        builder: (context, state) {
          final String title = state.extra as String;
          final String categoryId = state.pathParameters['categoryId'] ?? '';
          return ExplorePlacesScreen(title: title, categoryId: categoryId);
        },
      ),
      GoRoute(
        path: "${AppRoutes.explorePlacesByCityScreen}/:cityId",
        builder: (context, state) {
          final String title = state.extra as String;
          final String cityId = state.pathParameters['cityId'] ?? '';
          return ExplorePlacesScreen(title: title, cityId: cityId);
        },
      ),
      GoRoute(
        path: AppRoutes.placeDetailsScreen,

        builder: (context, state) {
          final place = state.extra as PlaceEntity;
          return PlaceDetailsScreen(place: place);
        },
      ),
      GoRoute(
        path: AppRoutes.settingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<UpdateProfileCubit>(),
          child: const EditProfileScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.addPaymentMethodScreen,
        builder: (context, state) => const AddPaymentMethodScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookingConfirmationScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AddBookingCubit>(),
          child: const BookingConfirmationScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.pendingApprovalScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<CancelBookingCubit>(),
          child: const PandingApprovalScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.acceptedScreen,
        builder: (context, state) => const AcceptedScreen(),
      ),
      GoRoute(
        path: AppRoutes.guideNavigationBarScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GuideNavigationBarCubit(),
            ),
            BlocProvider(
              create: (context) => getIt<DashboardCubit>(),
            ),
          ],
          child: const GuideNavigationBarScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.bookingRequestScreen,

        builder: (context, state) {
          final entity = state.extra as RequestCardEntity;
          return BookingRequestScreen(requestEntity: entity);
        },
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
        path: AppRoutes.tripDetailsScreen,
        builder: (context, state) => const TripDetailsScreen(),
      ),

      GoRoute(
        path: AppRoutes.chatScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ChatCubit(),
          child: const ChatScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.trackingScreen,
        builder: (context, state) => const TrackingScreen(),
      ),
      GoRoute(
        path: AppRoutes.tourGuideProfileScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => GuideProfileCubit(MediaPickerServiceImpl()),
          child: const TourGuideProfileScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.addCertificationScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => GuideProfileCubit(MediaPickerServiceImpl()),
          child: const AddCertificationScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.suggestedPackagesScreen,
        builder: (context, state) => const SuggestedPackagesScreen(),
      ),
      GoRoute(
        path: AppRoutes.packageDetailsScreen,
        builder: (context, state) => const PackageDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.packagePlaceDetailsScreen,
        builder: (context, state) => const PackagePlaceDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookPackageScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<BookPackageCubit>(),
          child: const BookPackageScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.viewLocationScreen,
        builder: (context, state) => const ViewLocationScreen(),
      ),
      GoRoute(
        path: AppRoutes.pickLocationScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<PickLocationCubit>(),
          child: const PickLocationScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.packageBookingSuccessScreen,
        builder: (context, state) => const PackageBookingSuccessScreen(),
      ),
      GoRoute(
        path: AppRoutes.aiPackagePlacesScreen,
        builder: (context, state) => const AiPackagePlacesScreen(),
      ),
      GoRoute(
        path: AppRoutes.bookAiPackageScreen,
        builder: (context, state) {
          final pacakge = state.extra as PackageEntity;
          return BlocProvider(
            create: (context) =>
                getIt<BookAiPackageCubit>()..setPacakgeId(pacakge.packageId),
            child: const BookAiPackageScreen(),
          );
        },
      ),
    ],
  );
}
