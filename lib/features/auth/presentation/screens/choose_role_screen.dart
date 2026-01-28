import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          108.verticalSpace,

          Text(
            context.l10n.chooseYourRole,
            style: AppTextStyles.poppinsBold38.copyWith(
              color: AppColors.primary,
            ),
          ),

          52.verticalSpace,

          Container(
            width: 370.w,
            height: 370.w,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AppImages.chooseRole,
              width: 370.w,
              height: 370.w,
            ),
          ),

          52.verticalSpace,

          AppButton(
            onPressed: () {},
            text: context.l10n.tourist,
            width: 200.w,
            radius: 40.r,
            textStyle: AppTextStyles.interSemiBold28,
          ),

          25.verticalSpace,

          AppButton(
            onPressed: () {},
            text: context.l10n.tourGuide,
            width: 200.w,
            radius: 40.r,
            textStyle: AppTextStyles.interSemiBold28,
          ),

          // To make the column take the full width and center the widgets
          double.infinity.horizontalSpace,
        ],
      ),
    );
  }
}
