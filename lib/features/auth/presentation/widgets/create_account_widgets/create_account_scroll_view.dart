import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class CreateAccountScrollView extends StatefulWidget {
  const CreateAccountScrollView({super.key});

  @override
  State<CreateAccountScrollView> createState() =>
      _CreateAccountScrollViewState();
}

class _CreateAccountScrollViewState extends State<CreateAccountScrollView> {
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: context.l10n.name),

        SizedBox(height: 20.h),

        CustomTextField(
          hintText: context.l10n.email,
          validator: (value) {
            return AppValidators.email(value);
          },
        ),

        SizedBox(height: 20.h),

        CustomTextField(
          controller: passwordcontroller,
          validator: (value) {
            return AppValidators.password(value);
          },
          hintText: context.l10n.password,
          obscureText: isPasswordHidden,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            icon: Icon(
              isPasswordHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility,
              color: AppColors.natural1,
              size: 22,
            ),
            // Icons.visibility_off_outlined,
            // color: AppColors.natural1,
            // size: 22,
          ),
        ),

        SizedBox(height: 20.h),

        CustomTextField(
          hintText: context.l10n.confirmPassword,
          obscureText: isConfirmPasswordHidden,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isConfirmPasswordHidden = !isConfirmPasswordHidden;
              });
            },
            icon: Icon(
              isConfirmPasswordHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility,
              color: AppColors.natural1,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
//Icons.visibility_off_outlined,
            // color: AppColors.natural1,
            // size: 22,