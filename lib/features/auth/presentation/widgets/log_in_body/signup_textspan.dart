import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SignupTextspan extends StatelessWidget {
  const SignupTextspan({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.l10n.haveIt,
                  style: AppTextStyles.interRegular14.copyWith(
                    color: AppColors.natural1,
                  ),
                ),
                TextSpan(
                  text: context.l10n.login,
                  style: AppTextStyles.interRegular14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              
                
              ],
            ),
          ),
      ],
    );
  }
}
