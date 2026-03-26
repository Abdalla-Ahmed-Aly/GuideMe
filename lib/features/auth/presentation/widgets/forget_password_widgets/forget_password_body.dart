import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/core/widgets/show_elegant_snackbar.dart';
import 'package:guide_me/features/auth/presentation/manager/send_forget_password/send_forget_password_cubit.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailcontroller = TextEditingController();

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
            SizedBox(height: size.height * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
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

            const SizedBox(height: 6),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: Text(
                context.l10n.forgotPassword,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),

            Padding(
              padding: EdgeInsets.only(left: 40.p, right: 34.p),
              child: Text(
                context.l10n.messege3,
                style: AppTextStyles.interRegular16.copyWith(
                  color: AppColors.natural3,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.p),
              child: Text(
                context.l10n.email,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 6),

            // email text field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: CustomTextField(
                controller: emailcontroller,
                hintText: context.l10n.request,
                validator: AppValidators.email,
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // send button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child:
                  BlocConsumer<
                    SendForgetPasswordCubit,
                    SendForgetPasswordState
                  >(
                    listener: (context, state) {
                      if (state is SendForgetPasswordSuccess) {
                        context.push(
                          AppRoutes.checkemailscreen,
                          extra: emailcontroller.text,
                        );
                      } else if (state is SendForgetPasswordFailure) {
                        showElegantSnackbar(
                          context,
                          state.failure.message ?? 'something is wrong',
                        );
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: AppButton(
                          isLoading: state is SendForgetPasswordLoading,
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              context
                                  .read<SendForgetPasswordCubit>()
                                  .sendForgetPassword(
                                    email: emailcontroller.text,
                                  );
                            }
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          },
                          text: context.l10n.send,
                          radius: 40,
                        ),
                      );
                    },
                  ),
            ),

            SizedBox(height: size.height * 0.12),

            // remember me and login text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${context.l10n.remember} ",
                        style: AppTextStyles.interRegular14.copyWith(
                          color: AppColors.natural3,
                        ),
                      ),
                      TextSpan(
                        text: context.l10n.login,
                        style: AppTextStyles.interSemiBold14.copyWith(
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pop();
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
