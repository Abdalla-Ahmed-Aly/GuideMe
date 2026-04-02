import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/auth/presentation/manager/resend_forget_password_cubit/resend_forget_password_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/verify_password_cubit/verify_password_cubit.dart';
import 'package:guide_me/features/auth/presentation/widgets/verification_code_widgets/time_send_code.dart';
import 'package:guide_me/features/auth/presentation/widgets/verification_code_widgets/verification_code%20_input.dart';

class VerificationCodeScreenBody extends StatefulWidget {
  final String email;
  const VerificationCodeScreenBody({
    super.key,
    required this.email,
  });

  @override
  State<VerificationCodeScreenBody> createState() =>
      _VerificationCodeScreenBodyState();
}

class _VerificationCodeScreenBodyState
    extends State<VerificationCodeScreenBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String otp = "";
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
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: const ArrowBackButton(),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            //check text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: Text(
                context.l10n.check,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // sent text
            Row(
              children: [
                // SizedBox(width: 40.w),
                Expanded(
                  child: RichText(
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
                          text: widget.email,
                          style: AppTextStyles.interMedium16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),

            // verification code input
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerificationCodeInput(
                  controller: otpController,
                  onCompleted: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),

            // verify button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child:
                  BlocConsumer<VerifyPasswordCubit, VerifyPasswordCubitState>(
                    listener: (context, state) {
                      if (state is VerifyPasswordCubitSuccessful) {
                        context.push(
                          AppRoutes.resetPasswordScreen,
                          extra: {
                            "email": widget.email,
                            "forgotPasswordOTP": otp,
                          },
                        );
                      } else if (state is VerifyPasswordCubitFailure) {
                        final error = FailureUiMapper.map(
                          context: context,
                          failure: state.failure,
                        );
                        context.showErrorSnakbar(message: error.message);
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: AppButton(
                          isLoading: state is VerifyPasswordCubitLoadings,
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              if (otp.isEmpty) {
                                context.showErrorSnakbar(
                                  message: context.l10n.pleaseEnterTheVerificationCode,
                                );
                                return;
                              }
                              context
                                  .read<VerifyPasswordCubit>()
                                  .verifyForgetPassword(
                                    email: widget.email,
                                    otp: otp,
                                  );
                            }
                          },
                          text: context.l10n.verify,
                          radius: 40,
                        ),
                      );
                    },
                  ),
            ),
            const SizedBox(height: 38),

            BlocConsumer<
              ResendForgetPasswordCubit,
              ResendForgetPasswordCubitState
            >(
              listener: (context, state) {
                if (state is ResendForgetPasswordCubitSuccess) {
                  setState(() {
                    otp = "";
                    otpController.clear();
                  });
                  context.showSuccessSnakbar(
                    message: context.l10n.otpSentAgain,
                  );
                } else if (state is ResendForgetPasswordCubFailure) {
                  final error = FailureUiMapper.map(
                    context: context,
                    failure: state.failure,
                  );
                  context.showErrorSnakbar(message: error.message);
                }
              },
              builder: (context, state) {
                return TimeSendCode(
                  onResend: () {
                    context
                        .read<ResendForgetPasswordCubit>()
                        .resendForgetPassword(email: widget.email);
                  },
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
