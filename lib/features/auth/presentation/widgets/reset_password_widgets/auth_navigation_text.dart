import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AuthNavigationText extends StatelessWidget {
  const AuthNavigationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
