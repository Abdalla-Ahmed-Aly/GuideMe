import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart';

class ProfileLanguageChip extends StatelessWidget {
  const ProfileLanguageChip({
    super.key,
    required this.language,
    required this.user,
  });

  final String language;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuideProfileCubit>();
    return BlocConsumer<GuideProfileCubit, GuideProfileState>(
      listener: (context, state) {
        if (state is GuideProfileSuccess && cubit.isDeletingLanguage) {
          context.read<UserCubit>().updateUser(state.user);
          cubit.isDeletingLanguage = false;
          context.showSuccessSnakbar(
            message: context.l10n.languagesUpdatedSuccessfully,
          );
        } else if (state is GuideProfileFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
        }
      },
      builder: (context, state) {
        return Chip(
          backgroundColor: AppColors.primary2.withValues(alpha: .05),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999),
          ),
          side: BorderSide.none,
          label: Text(
            language,
            style: AppTextStyles.interMedium14.copyWith(
              color: AppColors.primary2,
            ),
          ),
          deleteIcon: state is GuideProfileLoading && language == state.language
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary2,
                  ),
                )
              : const Icon(
                  Icons.close,
                  color: AppColors.primary2,
                ),
          onDeleted: cubit.languageInEditMode
              ? () {
                  if (state is! GuideProfileLoading) {
                    cubit.deleteLanguage(
                      language: language,
                      languages: user.languages,
                      userId: user.id,
                    );
                  }
                }
              : null,
        );
      },
    );
  }
}
