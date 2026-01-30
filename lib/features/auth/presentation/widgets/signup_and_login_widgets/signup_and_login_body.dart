import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/auth/presentation/widgets/signup_and_login_widgets/signup_and_login_custom_button.dart';

class SignupAndLoginBody extends StatelessWidget {
  const SignupAndLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 60,
        left: 28.p,
        right: 28.p,
        bottom: 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.natural7,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Image.asset(
              AppImages.exploreApp,
            ),
            13.verticalSpace,
            Text(
              context.l10n.exploreApp,
              style: AppTextStyles.poppinsBold32.copyWith(
                color: AppColors.primary500,
              ),
            ),

            SizedBox(height: size.height * 0.1),

            // Sign In Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: SignupAndLoginCustomButton(
                text: context.l10n.signIn,
                backgroundColor: AppColors.primary500,
                textStyle: AppTextStyles.interSemiBold16.copyWith(
                  color: AppColors.white,
                ),
                ontap: () {
                  context.push(AppRoutes.logInScreen);
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            // Create Account Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: SignupAndLoginCustomButton(
                text: context.l10n.createAccount,
                textStyle: AppTextStyles.interSemiBold16.copyWith(),
                backgroundColor: Colors.transparent,
                bordercolor: AppColors.black,
                ontap: () {
                  context.push(AppRoutes.createAccountScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
