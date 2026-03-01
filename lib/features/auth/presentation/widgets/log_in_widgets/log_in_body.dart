import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_widgets/divider_rule_body.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_widgets/login%20_with%20_social_media.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_widgets/signup_textspan.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
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
            Padding(
              padding: EdgeInsets.only(
                left: 38.p,
                top: 160,
                bottom: 41.p,
              ),
              child: Text(
                context.l10n.login,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 38.p,
              ),
              child: Text(
                "Email address",
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 6),

            // email text field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.p),
              child: CustomTextField(
                validator: AppValidators.email,
                hintText: context.l10n.email,
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 38.p,
                top: 20,
                bottom: 6,
              ),
              child: Text(
                "Password",
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            // password text field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.p),
              child: CustomTextField(
                validator: AppValidators.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isHiddenPassword,
                hintText: context.l10n.password,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHiddenPassword = !isHiddenPassword;
                    });
                  },
                  icon: Icon(
                    !isHiddenPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.natural1,
                    // size: 22,
                  ),
                ),
              ),
            ),

            // forgot password
            Padding(
              padding: EdgeInsets.only(
                top: 12,
                right: 38.p,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.forgetPasswordScreen);
                    },
                    child: Text(
                      context.l10n.forgotPassword,
                      style: AppTextStyles.interRegular14.copyWith(
                        decoration: TextDecoration.underline,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.06),

            // login button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.p),
              child: AppButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    context.go(AppRoutes.touristNavigationBarScreen);
                  }
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
                text: context.l10n.login,
                radius: 40,
              ),
            ),

            SizedBox(height: 38.h),

            const DividerRuleBody(),

            SizedBox(
              height: 22.h,
            ),

            // social media login
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: LoginWithSocialMedia(
                    AppIcons.facebook,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: LoginWithSocialMedia(
                    AppIcons.google,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: LoginWithSocialMedia(
                    AppIcons.phone,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),

            // footer text
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignupTextspan(),
              ],
            ),

            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
