import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:guide_me/core/services/hive_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> logoAnim;
  late Animation<double> whiteNileAnim;
  late Animation<double> blueNileAnim;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    logoAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.33, curve: Curves.easeOut),
      ),
    );

    whiteNileAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 0.66, curve: Curves.easeOut),
      ),
    );

    blueNileAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.66, 1.0, curve: Curves.easeOut),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..checkAuth(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashAuthenticated) {
            if (state.userRole == UserRole.tourist) {
              Future.delayed(const Duration(seconds: 1), () {
                context.go(AppRoutes.touristNavigationBarScreen);
              });
            } else {
              Future.delayed(const Duration(seconds: 1), () {
                context.go(AppRoutes.guideNavigationBarScreen);
              });
            }
          } else if (state is SplashUnAuthenticated) {
            Future.delayed(const Duration(seconds: 1), () {
              context.go(AppRoutes.onBoardingScreen);
            });
          } else if (state is SplashGuideOnboardingPending) {
            Future.delayed(const Duration(seconds: 1), () {
              context.go(AppRoutes.guideVerificationScreen);
            });
          } else if (state is SplashGuideOnboardingApproved) {
            Future.delayed(const Duration(seconds: 1), () {
              if (HiveService.hasSeenSuccess()) {
                context.go(AppRoutes.guideNavigationBarScreen);
              } else {
                context.go(AppRoutes.guideVerificationSuccessScreen);
              }
            });
          } else if (state is SplashGuideOnboardingRejected) {
            Future.delayed(const Duration(seconds: 1), () {
              context.go(AppRoutes.verificationFailedScreen, extra: state.message);
            });
          } else if (state is SplashNeedNationality) {
            Future.delayed(const Duration(seconds: 1), () {
              context.go(AppRoutes.chooseNationalityScreen);
            });
          } else if (state is SplashNeedLocation) {
            Future.delayed(const Duration(seconds: 1), () {
              context.go(AppRoutes.allowLocationAccessScreen);
            });
          } else if (state is SplashGuideOnboardingNotSubmitted) {
            Future.delayed(const Duration(seconds: 1), () {
              context.go(AppRoutes.guideProfessionalInfoScreen);
            });
          }
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                // Logo
                Center(
                  child: FadeTransition(
                    opacity: logoAnim,
                    child: Image.asset(AppImages.logo),
                  ),
                ),

                // Blue Nile
                Center(
                  child: FadeTransition(
                    opacity: blueNileAnim,
                    child: Image.asset(AppImages.blueNile),
                  ),
                ),

                // White Nile
                Center(
                  child: FadeTransition(
                    opacity: whiteNileAnim,
                    child: Image.asset(AppImages.whiteNile),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
