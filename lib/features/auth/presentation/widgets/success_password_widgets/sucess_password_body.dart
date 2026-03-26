import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class SuccessPasswordbody extends StatelessWidget {
  const SuccessPasswordbody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 80),

        Center(
          child: Image.asset(
            AppImages.success,
            width: 293.w,
            height: 293.h,
          ),
        ),

        const SizedBox(height: 28),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.p),
          child: Text(
            context.l10n.success,
            textAlign: TextAlign.center,
            style: AppTextStyles.poppinsBold30.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.p),
          child: Text(
            context.l10n.success1,
            textAlign: TextAlign.center,
            style: AppTextStyles.interRegular16.copyWith(
              color: AppColors.natural3,
            ),
          ),
        ),

        const SizedBox(height: 38),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.p),
          child: AppButton(
            onPressed: () {
              context.go(AppRoutes.logInScreen);
            },
            text: context.l10n.back,
            radius: 40,
          ),
        ),
      ],
    );
  }
}
