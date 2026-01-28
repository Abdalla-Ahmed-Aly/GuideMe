import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:guide_me/features/auth/presentation/widgets/custom_textspan.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 90.p, left: 40.p),
            child: const ArrowBackButton(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.forgotPasswordPhotroom,
                width: 332.w,
                height: 248.h,
              ),
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 26.p),
          //   child:
          // ),
          SizedBox(
            height: 6.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.p),
            child: Text(
              context.l10n.forgotPassword,
              style: AppTextStyles.poppinsBold30.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.p, right: 34.p),
            child: Text(
              context.l10n.messege3,
              style: AppTextStyles.interRegular16.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),
          SizedBox(
            height: 38.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.p, bottom: 6.p),
            child: Text(
              "Email address",
              style: AppTextStyles.interRegular14.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.p, right: 40.p),
            child: CustomTextField(
              hintText: context.l10n.request,
            ),
          ),
          SizedBox(
            height: 38.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.p),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.checkemailscreen);
              },
              text: context.l10n.send,
              radius: 40.r,
            ),
          ),
          SizedBox(
            height: 113.h,
          ),
          CustomTextspan(
            context.l10n.remember,
            AppColors.natural3,
            AppTextStyles.interRegular14,
            context.l10n.login,
            AppColors.primary,
            AppTextStyles.interSemiBold14,
          ),
        ],
      ),
    );
  }
}
