import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/profile/presentation/cubits/cubit/update_profile_cubit.dart';

class SaveChangesSection extends StatelessWidget {
  const SaveChangesSection({
    super.key,
    required this.nameController,
    required this.phoneController,
  });
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    final updateProfileCubit = context.read<UpdateProfileCubit>();
    final user = (context.read<UserCubit>().state as UserSuccess).user;
    return AnimatedBuilder(
      animation: Listenable.merge([nameController, phoneController]),
      builder: (context, child) {
        return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state.isSuccess) {
              context.read<UserCubit>().updateUser(state.user!);
              phoneController.text = state.user!.phone ?? '';
              nameController.text = state.user!.name ?? '';
              updateProfileCubit.resetState();
              buildSuccessBottomSheet(context);
            } else if (state.failure != null) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure!,
              );
              context.showErrorSnakbar(message: error.message);
            }
          },
          builder: (context, state) {
            final user = (context.read<UserCubit>().state as UserSuccess).user;
            final bool isDataChanges = updateProfileCubit.isDataChanges(
              name: nameController.text,
              phone: phoneController.text,
              oldData: user,
            );
            return AppButton(
              isLoading: state.isLoading,
              onPressed: !isDataChanges
                  ? null
                  : () {
                      updateProfileCubit.updateProfile(
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                    },
              text: context.l10n.saveChanges,
              textStyle: AppTextStyles.interSemiBold18,
            );
          },
        );
      },
    );
  }

  Future<dynamic> buildSuccessBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          left: false,
          right: false,
          top: false,
          child: SizedBox(
            height: context.screenHeight * 0.5,
            child: Column(
              children: [
                const SizedBox(height: 16),

                Container(
                  height: 6,
                  width: 146,
                  decoration: BoxDecoration(
                    color: const Color(0xff999999),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        Image.asset(
                          AppImages.success,
                          height: context.isPortrait
                              ? context.screenHeight * 0.2
                              : context.screenWidth * 0.2,
                        ),

                        const SizedBox(height: 16),

                        Text(
                          context.l10n.successMsg,
                          style: AppTextStyles.interMedium30.copyWith(
                            color: const Color(0xff181F71),
                          ),
                        ),

                        const SizedBox(height: 28),

                        Text(
                          context.l10n.yourAccountSaved,
                          style: AppTextStyles.interMedium10.copyWith(
                            color: const Color(
                              0xff505050,
                            ).withValues(alpha: .5),
                          ),
                        ),

                        const SizedBox(height: 14),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 50.p,
                            right: 50.p,
                          ),
                          child: AppButton(
                            onPressed: () {
                              context.pop();
                            },
                            text: context.l10n.confirmMsg,
                            textStyle: AppTextStyles.interSemiBold18,
                            radius: 20,
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom + 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
