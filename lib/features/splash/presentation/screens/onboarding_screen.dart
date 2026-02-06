import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/features/splash/presentation/widgets/onboarding_widgets/arrow_button.dart';
import 'package:guide_me/features/splash/presentation/widgets/onboarding_widgets/onboarding_one.dart';
import 'package:guide_me/features/splash/presentation/widgets/onboarding_widgets/onboarding_three.dart';
import 'package:guide_me/features/splash/presentation/widgets/onboarding_widgets/onboarding_two.dart';
import 'package:guide_me/features/splash/presentation/widgets/onboarding_widgets/page_indicators.dart';
import 'package:guide_me/features/splash/presentation/widgets/onboarding_widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [
              OnboardingOne(),
              OnboardingTwo(),
              OnboardingThree(),
            ],
          ),

          // Skip Button
          currentPage == 2
              ? const SizedBox()
              : Positioned(
                  top: 100.h,
                  right: 54.w,
                  child: const SkipButton(),
                ),

          // Page Indicators
          Positioned(
            bottom: 138.h,
            left: 40.w,
            child: PageIndicators(currentPage: currentPage),
          ),

          // Next Button
          Positioned(
            bottom: 105.h,
            right: 40.w,
            child: ArrowButton(
              onTap: () {
                currentPage++;
                if (currentPage < 3) {
                  _pageController.animateToPage(
                    currentPage,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  context.go(AppRoutes.signupAndLoginScreen);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
