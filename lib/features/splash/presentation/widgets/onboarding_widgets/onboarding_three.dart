import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shape in top left
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            AppImages.onboardingThreeTopShape,
            fit: BoxFit.fill,
            height: 191.h,
            width: 258.w,
          ),
        ),

        // Shape in bottom right
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            AppImages.onboardingThreeBottomShape,
            fit: BoxFit.fill,
            height: 251.h,
            width: 187.w,
          ),
        ),

        // Main content
        Positioned(
          left: 0,
          right: 0,
          top: 158.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.onboardingThree,
                height: 496.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 36.w, right: 52.w),
                child: Text(
                  context.l10n.onboardingThree,
                  style: AppTextStyles.poppinsRegular16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
