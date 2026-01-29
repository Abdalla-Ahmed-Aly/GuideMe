import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/verification_code_widgets/time_send_code.dart';
import 'package:guide_me/features/auth/presentation/widgets/verification_code_widgets/verification_code%20_input.dart';
import 'package:guide_me/features/auth/presentation/widgets/custom_textspan.dart';

class VerificationCodeScreenBody extends StatelessWidget {
  const VerificationCodeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.09),
          Padding(
            padding: EdgeInsets.only(left: 40.p, right: 352.p),
            child: const ArrowBackButton(),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.p, right: 52.p, bottom: 19),
            child: Text(
              context.l10n.check,
              style: AppTextStyles.poppinsBold30.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.p),
            child: CustomTextspan(
              context.l10n.sent,
              AppColors.natural3,
              AppTextStyles.interRegular16,
              context.l10n.email1,
              AppColors.black,
              AppTextStyles.interMedium16,
            ),
          ),
          SizedBox(
            height: 38.p,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.p),
            child: const VerificationCodeInput(),
          ),
          SizedBox(
            height: 38.p,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.p),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.resetPasswordScreen);
              },
              text: context.l10n.verify,
              radius: 40.r,
            ),
          ),
          SizedBox(
            height: 38.p,
          ),

          const TimeSendCode(),
        ],
      ),
    );
  }
}
