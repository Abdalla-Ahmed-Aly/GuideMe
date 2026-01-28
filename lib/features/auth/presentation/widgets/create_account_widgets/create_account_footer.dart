import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CreateAccountFooter extends StatelessWidget {
  const CreateAccountFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.p),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${context.l10n.askAccount} ",
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.natural1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.go(AppRoutes.logInScreen);
                },
                child: Text(
                  context.l10n.login,
                  style: AppTextStyles.interRegular14.copyWith(
                    color: AppColors.primary500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 38.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${context.l10n.massage} ",
                  style: AppTextStyles.interRegular14.copyWith(
                    color: AppColors.natural1,
                  ),
                ),
                TextSpan(
                  text: context.l10n.massage1,
                  style: AppTextStyles.interRegular14.copyWith(
                    color: AppColors.primary500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary500,
                  ),
                ),
              ],
            ),
          ),
          26.verticalSpace,
        ],
      ),
    );
  }
}
