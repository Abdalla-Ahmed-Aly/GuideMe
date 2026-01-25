import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/auth/presentation/widgets/signup_and_login_body/signup_and_login_custombutton.dart';

class SignupAndLoginBody extends StatelessWidget {
  const SignupAndLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 68.p,
        right: 29.p,
        left: 28.p,
        bottom: 39.p,
      ),
      child: Container(
        width: 373.w,
        height: 825.h,
        decoration:  BoxDecoration(
          color: AppColors.natural7,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 95.p,
                right: 21.p,
                left: 25.p,
                bottom: 7.p,
              ),
              child: Image.asset(
                AppImages.exploreApp,
                width: 327.w,
                height: 327.h,
              ),
            ),
            Text(
              context.l10n.exploreApp,
              style: AppTextStyles.poppinsBold32.copyWith(
                color: AppColors.primary500,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 115.p, left: 10.p, right: 10.p),
              child: SignupAndLoginCustombutton(
                text: context.l10n.signIn,
                backgroundColor: AppColors.primary500,
                textStyle: AppTextStyles.interSemiBold16.copyWith(
                  color: AppColors.white,
                ),
                ontap: () {
                
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SignupAndLoginCustombutton(
              text: context.l10n.createAccount,
              textStyle: AppTextStyles.interSemiBold16.copyWith(),
              backgroundColor: Colors.transparent,
              bordercolor: AppColors.black,
              ontap: () {
                context.go(AppRoutes.createAccountScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
