import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_body/custom_text_field.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_body/divider_rule_body.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_body/login%20_with%20_social_media.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_body/signup_textspan.dart';

class LogInBodyWidget extends StatelessWidget {
  const LogInBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20.p,
              right: 270.p,
              top: 145.p,
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
              left: 20.p,
              right: 270.p,
            ),
            child: Text(
              "Email address",
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: CustomTextField(
              hintText: context.l10n.email,
              suffixIcon: Padding(
                padding: EdgeInsets.all(15.p),
                child: SvgPicture.asset(AppIcons.correct),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.p, right: 270.p, top: 22.p),
            child: Text(
              "Password",
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: CustomTextField(
              obscureText: true,
              hintText: context.l10n.password,
              suffixIcon: Padding(
                padding: EdgeInsets.all(15.p),
                child: SvgPicture.asset(AppIcons.hidePassword),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.p, left: 254.p, bottom: 38.p),
            child: GestureDetector(
              onTap: () {
                context.push(AppRoutes.forgetPasswordScreen);
              },
              child: Text(
                context.l10n.forgotPassword,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: AppButton(
              onPressed: () {},
              text: context.l10n.login,
              radius: 40.r,
            ),
          ),
          SizedBox(height: 38.h),
          const DividerRuleBody(),
          SizedBox(
            height: 31.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(11.p),
                child: const LoginWithSocialMedia(
                  AppIcons.facebook,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(11.p),
                child: const LoginWithSocialMedia(
                  AppIcons.google,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(11.p),
                child: const LoginWithSocialMedia(
                  AppIcons.phone,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 109.p, right: 112.p),
            child: const SignupTextspan(),
          ),
          SizedBox(
            height: 54.h,
          ),
        ],
      ),
    );
  }
}
