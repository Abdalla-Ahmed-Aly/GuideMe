import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/di/user_scope.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/app_validators.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:guide_me/features/auth/presentation/manager/login_with_google_cubit/login_with_google_cubit.dart';
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
  final TextEditingController emailcontroll = TextEditingController();
  final TextEditingController passwordcontroll = TextEditingController();

  @override
  void dispose() {
    emailcontroll.dispose();
    passwordcontroll.dispose();
    super.dispose();
  }

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
                right: 38.p,
                top: 160.h,
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
              padding: EdgeInsets.symmetric(horizontal: 38.p),
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
              padding: EdgeInsets.symmetric(horizontal: 38.p),
              child: CustomTextField(
                controller: emailcontroll,
                validator: AppValidators.email,
                hintText: context.l10n.email,
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 38.p,
                right: 38.p,
                top: 20,
                bottom: 6,
              ),
              child: Text(
                context.l10n.password,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            // password text field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.p),
              child: CustomTextField(
                controller: passwordcontroll,
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
                left: 38.p,
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
              padding: EdgeInsets.symmetric(horizontal: 20.p),
              child: BlocConsumer<LoginCubit, LoginCubitState>(
                listener: (context, state) async {
                  if (state is LoginCubitSuccessful) {
                    final user = state.data.user;
                    if (user.role == UserRole.tourist) {
                      await UserScope.initUserScope();
                      context.go(AppRoutes.touristNavigationBarScreen);
                    } else if (user.role == UserRole.guide) {
                      final status = user.verificationStatus;
                      if (status == 'not-submitted') {
                        context.go(AppRoutes.guideProfessionalInfoScreen);
                      } else if (status == 'pending') {
                        context.go(AppRoutes.guideVerificationScreen);
                      } else if (status == 'approve' || status == 'approved') {
                        await UserScope.initUserScope();
                        context.go(AppRoutes.guideVerificationSuccessScreen);
                      } else if (status == 'rejected') {
                        context.go(AppRoutes.verificationFailedScreen);
                      } else {
                        await UserScope.initUserScope();
                        context.go(AppRoutes.guideNavigationBarScreen);
                      }
                    } else {
                      context.showErrorSnakbar(
                        message: context.l10n.invalidEmailOrPassword,
                      );
                    }
                  } else if (state is LoginCubitFailure) {
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
                      isLoading: state is LoginCubitLoading,
                      onPressed: () {
                        if (formkey.currentState?.validate() ?? false) {
                          context.read<LoginCubit>().login(
                            email: emailcontroll.text,
                            password: passwordcontroll.text,
                          );
                        }
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      },
                      text: context.l10n.login,

                      radius: 40,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 38.h),

            const DividerRuleBody(),

            SizedBox(
              height: 22.h,
            ),

            // social media login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child:
                      BlocConsumer<LoginwithGoogleCubit, LoginwithGoogleState>(
                        listener: (context, state) async {
                          if (state is LoginwithGoogleSuccess) {
                            final user = state.userModel.user;
                            if (user.role == UserRole.tourist) {
                              await UserScope.initUserScope();
                              context.go(AppRoutes.touristNavigationBarScreen);
                            } else {
                              final status = user.verificationStatus;
                              if (status == 'not-submitted') {
                                context.go(
                                  AppRoutes.guideProfessionalInfoScreen,
                                );
                              } else if (status == 'pending') {
                                context.go(AppRoutes.guideVerificationScreen);
                              } else if (status == 'approve' ||
                                  status == 'approved') {
                                await UserScope.initUserScope();
                                context.go(
                                  AppRoutes.guideVerificationSuccessScreen,
                                );
                              } else if (status == 'rejected') {
                                context.go(AppRoutes.verificationFailedScreen);
                              } else {
                                await UserScope.initUserScope();
                                context.go(AppRoutes.guideNavigationBarScreen);
                              }
                            }
                          } else if (state is LoginwithGooglefailure) {
                            final error = FailureUiMapper.map(
                              context: context,
                              failure: state.failure,
                            );
                            context.showErrorSnakbar(message: error.message);
                          }
                        },
                        builder: (context, state) {
                          return LoginWithSocialMedia(
                            isLoading: state is LoginwithGoogleLoading,
                            onTap: () {
                              context
                                  .read<LoginwithGoogleCubit>()
                                  .loginWithGoogle();
                            },
                            AppIcons.google,
                          );
                        },
                      ),
                ),
              ],
            ),

            SizedBox(height: 70.h),

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
