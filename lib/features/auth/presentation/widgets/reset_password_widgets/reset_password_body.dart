import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import 'package:guide_me/core/widgets/show_elegant_snackbar.dart';
import 'package:guide_me/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:guide_me/features/auth/presentation/widgets/reset_password_widgets/auth_navigation_text.dart';

class ResetPasswordBody extends StatefulWidget {
  final String email;
  final String otp;
  const ResetPasswordBody({super.key, required this.email, required this.otp});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController confirmpasswordcontroll = TextEditingController();
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

            SizedBox(height: size.height * 0.07),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: Text(
                context.l10n.request2,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
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
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: Text(
                context.l10n.newPassword,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 6),

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
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: Text(
                context.l10n.confirm,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 6),

            // Confirm Password TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.p),
              child: CustomTextField(
                controller: confirmpasswordcontroll,
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
              child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    context.go(AppRoutes.successPasswordScreen);
                  } else if (state is ResetPasswordfailure) {
                    showElegantSnackbar(
                      context,
                      state.failure.message ?? 'something is wrong',
                    );
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: AppButton(
                      isLoading: state is ResetPasswordLoading,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<ResetPasswordCubit>().resetPassword(
                            email: widget.email,
                            newPassword: passwordController.text,
                            confirmPassword: confirmpasswordcontroll.text,
                            otp: widget.otp,
                          );
                        }
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      },
                      text: context.l10n.request2,
                      radius: 40,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.15),

            const AuthNavigationText(),

            SizedBox(height: size.height * 0.06),
          ],
        ),
      ),
    );
  }
}
