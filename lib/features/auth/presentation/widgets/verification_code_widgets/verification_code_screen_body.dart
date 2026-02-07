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

class VerificationCodeScreenBody extends StatefulWidget {
  const VerificationCodeScreenBody({super.key});

  @override
  State<VerificationCodeScreenBody> createState() =>
      _VerificationCodeScreenBodyState();
}

class _VerificationCodeScreenBodyState
    extends State<VerificationCodeScreenBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.08),

            //arrow back button
            Padding(
              padding: EdgeInsets.only(left: 40.p),
              child: const ArrowBackButton(),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            //check text
            Padding(
              padding: EdgeInsets.only(left: 40.p, right: 52.p, bottom: 19),
              child: Text(
                context.l10n.check,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),

            // sent text
            Row(
              children: [
                SizedBox(width: 40.w),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${context.l10n.sent} ",
                        style: AppTextStyles.interRegular16.copyWith(
                          color: AppColors.natural3,
                        ),
                      ),
                      TextSpan(
                        text: context.l10n.email1,
                        style: AppTextStyles.interMedium16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: size.height * 0.04,
            ),

            // verification code input
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerificationCodeInput(),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),

            // verify button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: AppButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    context.push(AppRoutes.resetPasswordScreen);
                  }
                },
                text: context.l10n.verify,
                radius: 40,
              ),
            ),
            SizedBox(
              height: 38.p,
            ),

            const TimeSendCode(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
