import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class CreateAccountScrollView extends StatelessWidget {
  const CreateAccountScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: context.l10n.name),

        SizedBox(height: 20.h),

        CustomTextField(hintText: context.l10n.email),

        SizedBox(height: 20.h),

        CustomTextField(
          hintText: context.l10n.password,
          obscureText: true,
          suffixIcon: const Icon(
            Icons.visibility_off_outlined,
            color: AppColors.natural1,
            size: 22,
          ),
        ),

        SizedBox(height: 20.h),

        CustomTextField(
          hintText: context.l10n.confirmPassword,
          obscureText: true,
          suffixIcon: const Icon(
            Icons.visibility_off_outlined,
            color: AppColors.natural1,
            size: 22,
          ),
        ),
      ],
    );
  }
}
