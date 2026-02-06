import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.signupAndLoginScreen);
      },
      child: Text(
        context.l10n.skip,
        style: AppTextStyles.poppinsMedium18,
      ),
    );
  }
}
