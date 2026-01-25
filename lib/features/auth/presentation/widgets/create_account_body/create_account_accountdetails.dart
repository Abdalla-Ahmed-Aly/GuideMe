import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CreateAccountAccountdetails extends StatelessWidget {
  const CreateAccountAccountdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.askAccount,
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.black,
              ),
            ),

            Text(
              context.l10n.login,
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.primary500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary500,
              ),
            ),
          ],
        ),
        SizedBox(height: 38.h),
        Text(
          context.l10n.massage,
          style: AppTextStyles.interRegular14.copyWith(
            color: AppColors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.massage1,
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.black,
              ),
            ),

            Text(
              context.l10n.massage2,
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.primary500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary500,
              ),
            ),
            SizedBox(height: 26.h),
          ],
        ),
        
        
      ],
    );
  }
}
