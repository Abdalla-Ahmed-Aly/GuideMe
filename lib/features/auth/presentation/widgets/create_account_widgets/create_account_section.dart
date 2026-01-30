import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class CreateAccountSection extends StatefulWidget {
  const CreateAccountSection({super.key});

  @override
  State<CreateAccountSection> createState() => _CreateAccountSectionState();
}

class _CreateAccountSectionState extends State<CreateAccountSection> {
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Name TextField
        CustomTextField(
          hintText: context.l10n.name,
          validator: AppValidators.name,
          keyboardType: TextInputType.name,
        ),

        SizedBox(height: 20.h),

        // Email TextField
        CustomTextField(
          hintText: context.l10n.email,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return AppValidators.email(value);
          },
        ),

        SizedBox(height: 20.h),

        // Password TextField
        CustomTextField(
          controller: passwordcontroller,
          validator: AppValidators.password,
          keyboardType: TextInputType.visiblePassword,
          hintText: context.l10n.password,
          obscureText: isPasswordHidden,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            icon: Icon(
              !isPasswordHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.natural1,
            ),
          ),
        ),

        SizedBox(height: 20.h),

        // Confirm Password TextField
        CustomTextField(
          validator: (value) {
            return AppValidators.confirmPassword(
              value,
              passwordcontroller.text,
            );
          },
          keyboardType: TextInputType.visiblePassword,
          hintText: context.l10n.confirmPassword,
          obscureText: isConfirmPasswordHidden,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isConfirmPasswordHidden = !isConfirmPasswordHidden;
              });
            },
            icon: Icon(
              !isConfirmPasswordHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.natural1,
            ),
          ),
        ),
      ],
    );
  }
}
