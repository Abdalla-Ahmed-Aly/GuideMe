import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/routes/app_routes.dart';

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
    _impelementNavigation();
  }

  void _impelementNavigation() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).go(AppRoutes.onBoardingScreen);
      },
    );
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
    return Scaffold(
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
            Positioned(
              bottom: size.height * .43,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: logoAnim,
                child: Image.asset(AppImages.logo),
              ),
            ),

            // Blue Nile
            Positioned(
              bottom: size.height * .34,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: blueNileAnim,
                child: Image.asset(AppImages.blueNile),
              ),
            ),

            // White Nile
            Positioned(
              bottom: size.height * .35,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: whiteNileAnim,
                child: Image.asset(AppImages.whiteNile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
