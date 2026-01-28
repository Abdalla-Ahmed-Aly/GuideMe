import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shape in top left
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            AppImages.onboardingOneTopShape,
            fit: BoxFit.fill,
            height: 185.h,
            width: 173.w,
          ),
        ),

        // Shape in bottom right
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            AppImages.onboardingOneBottomShape,
            fit: BoxFit.fill,
            height: 276.h,
            width: 351.w,
          ),
        ),

        // Main content
        Positioned(
          left: 0,
          right: 0,
          top: 175.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.onboardingOne,
                height: 478.h,
              ),
              28.verticalSpace,
              Padding(
                padding: EdgeInsets.only(right: 63.w, left: 47.w),
                child: Text(
                  context.l10n.onboardingOne,
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
