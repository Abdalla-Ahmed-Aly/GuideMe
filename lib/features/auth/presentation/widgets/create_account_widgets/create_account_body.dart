import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/show_elegant_snackbar.dart';
import 'package:guide_me/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_widgets/create_account_section.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_widgets/create_account_footer.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.07,
            left: 28.p,
            right: 28.p,
            bottom: size.height * 0.05,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.natural7,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),

                // Image
                Image.asset(
                  AppImages.guideMe,
                  width: 254.w,
                  height: 135.h,
                ),

                const SizedBox(height: 6),
                Text(
                  context.l10n.createAccount,
                  style: AppTextStyles.poppinsBold32.copyWith(
                    color: AppColors.primary500,
                  ),
                ),

                const SizedBox(height: 16),

                // Create Account Section
                Padding(
                  padding: EdgeInsets.only(left: 10.p, right: 10.p),
                  child: CreateAccountSection(
                    namecontroll: nameController,
                    emailcontroll: emailController,
                    passwordcontroll: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    phonecontroll: phoneController,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                Padding(
                  padding: EdgeInsets.only(right: 10.p, left: 10.p),
                  child: BlocConsumer<RegisterCubit, RegisterCubitState>(
                    listener: (context, state) {
                      if (state is RegisterCubitSuccessful) {
                        context.push(AppRoutes.chooseNationalityScreen);
                      } else if (state is RegisterCubitFailure) {
                        showElegantSnackbar(
                          context,
                          state.failure.message ?? 'something is wrong',
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        isLoading: state is RegisterCubitLoading,
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await context.read<RegisterCubit>().registre(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          }
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        },
                        text: context.l10n.createAccount,
                      );
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                const CreateAccountFooter(),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
