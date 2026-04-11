import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/services/hive_service.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_widgets/create_account_footer.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_widgets/create_account_section.dart';

import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/features/auth/presentation/widgets/role_selection_widgets/role_selection_card.dart';

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
  UserRole? selectedRole;
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
                SizedBox(height: 16),
     // Role Selection
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.p),
                  child: Row(
                    children: [
                      Expanded(
                        child: RoleSelectionCard(
                          role: UserRole.tourist,
                          isSelected: selectedRole == UserRole.tourist,
                          onTap: () => setState(() => selectedRole = UserRole.tourist),
                          title: context.l10n.tourist,
                          icon: Icons.person_pin_circle_outlined,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoleSelectionCard(
                          role: UserRole.guide,
                          isSelected: selectedRole == UserRole.guide,
                          onTap: () => setState(() => selectedRole = UserRole.guide),
                          title: context.l10n.tourGuide,
                          icon: Icons.explore_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                
                  SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.only(right: 10.p, left: 10.p),
                  child: BlocConsumer<RegisterCubit, RegisterCubitState>(
                    listener: (context, state) {
                      if (state is RegisterCubitSuccessful) {
                        if (selectedRole != null) {
                          HiveService.saveUserRole(selectedRole!);
                        }
                        context.push(AppRoutes.chooseNationalityScreen);
                      } else if (state is RegisterCubitFailure) {
                        final error = FailureUiMapper.map(
                          context: context,
                          failure: state.failure,
                        );
                        context.showErrorSnakbar(message: error.message);
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        isLoading: state is RegisterCubitLoading,
                        onPressed: () async {
                          if (selectedRole == null) {
                            context.showErrorSnakbar(message: "Please select your role first");
                            return;
                          }
                          if (formkey.currentState!.validate()) {
                            await context.read<RegisterCubit>().registre(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                              role: selectedRole!,
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
