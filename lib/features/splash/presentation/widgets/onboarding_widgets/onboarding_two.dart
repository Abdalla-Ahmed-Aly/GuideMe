import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shape in top left
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            AppImages.onboardingTwoTopShape,
            fit: BoxFit.fill,
            height: 143.h,
            width: 155.w,
          ),
        ),

        // Shape in bottom right
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            AppImages.onboardingTwoBottomShape,
            fit: BoxFit.fill,
            height: 237.h,
            width: 194.w,
          ),
        ),

        // Main content
        Positioned(
          left: 0,
          right: 0,
          top: 150.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.onboardingTwo,
                height: 464.h,
              ),
              14.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44.w),
                child: Text(
                  context.l10n.onboardingTwo,
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
