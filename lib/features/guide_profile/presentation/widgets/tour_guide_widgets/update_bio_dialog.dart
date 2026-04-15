import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart';

class UpdateBioDialog extends StatefulWidget {
  const UpdateBioDialog({super.key, this.bio, required this.userId});
  final String? bio;
  final String userId;

  @override
  State<UpdateBioDialog> createState() => _UpdateBioDialogState();
}

class _UpdateBioDialogState extends State<UpdateBioDialog> {
  late TextEditingController _bioController;
  bool isChanged = false;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController(text: widget.bio ?? "");

    _bioController.addListener(() {
      final current = _bioController.text.trim();

      setState(() {
        isChanged = current != widget.bio?.trim();
      });
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final guideProfileCubit = context.read<GuideProfileCubit>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 22.p),
      backgroundColor: Colors.white,
      title: Text(
        context.l10n.editBio,
        style: AppTextStyles.interSemiBold18,
      ),
      content: CustomTextField(
        controller: _bioController,
        maxLines: 5,
        hintText: context.l10n.writeAboutYou,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: isRunning
                    ? null
                    : () {
                        context.pop();
                      },
                child: Text(
                  context.l10n.cancel,
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<GuideProfileCubit, GuideProfileState>(
                listener: (context, state) {
                  if (state is GuideProfileSuccess &&
                      guideProfileCubit.isUpdatingBio) {
                    context.read<UserCubit>().updateUser(state.user);
                    guideProfileCubit.isUpdatingBio = false;
                    context.showSuccessSnakbar(
                      message: context.l10n.bioUpdatedSuccessfully,
                    );
                    setState(() {
                      isRunning = false;
                    });
                    context.pop();
                  } else if (state is GuideProfileFailure) {
                    final error = FailureUiMapper.map(
                      context: context,
                      failure: state.failure,
                    );
                    context.showErrorSnakbar(message: error.message);
                    setState(() {
                      isRunning = false;
                    });
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    loadWidth: context.screenWidth,
                    isLoading: state is GuideProfileLoading,
                    onPressed: isChanged && !isRunning
                        ? () {
                            setState(() {
                              isRunning = true;
                            });
                            context.read<GuideProfileCubit>().updateBio(
                              userId: widget.userId,
                              bio: _bioController.text,
                            );
                          }
                        : null,
                    text: context.l10n.save,
                    height: 40,
                    radius: 20,
                    backgroundColor: AppColors.primary2,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
