import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/auth/presentation/widgets/reset_password_widgets/auth_navigation_text.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: EdgeInsets.only(left: 40.p),
              child: const ArrowBackButton(),
            ),

            SizedBox(height: size.height * 0.09),

            Padding(
              padding: EdgeInsets.only(
                left: 39.p,
                bottom: 16,
              ),
              child: Text(
                context.l10n.request2,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 39.p, right: 45.p),
              child: Text(
                context.l10n.request3,
                style: AppTextStyles.interRegular16.copyWith(
                  color: AppColors.natural3,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.p, right: 270.p, bottom: 6),
              child: Text(
                "New Password",
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            // New Password TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: CustomTextField(
                validator: AppValidators.password,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isNewPasswordHidden,
                hintText: context.l10n.password,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isNewPasswordHidden = !isNewPasswordHidden;
                    });
                  },
                  icon: Icon(
                    !isNewPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.natural1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),

            Padding(
              padding: EdgeInsets.only(left: 44.p, right: 238.p, bottom: 6),
              child: Text(
                context.l10n.confirm,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            // Confirm Password TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: CustomTextField(
                validator: (value) {
                  return AppValidators.confirmPassword(
                    value,
                    passwordController.text,
                  );
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: isConfirmPasswordHidden,
                hintText: context.l10n.request4,
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
            ),
            SizedBox(
              height: size.height * 0.04,
            ),

            // Submit Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: AppButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    context.go(AppRoutes.successPasswordScreen);
                  }
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
                text: context.l10n.request2,
                radius: 40.r,
              ),
            ),
            SizedBox(
              height: size.height * 0.18,
            ),
            const AuthNavigationText(),
            SizedBox(
              height: size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
