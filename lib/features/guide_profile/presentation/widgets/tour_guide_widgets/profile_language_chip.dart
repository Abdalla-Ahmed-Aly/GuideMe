import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart';

class ProfileLanguageChip extends StatelessWidget {
  const ProfileLanguageChip({
    super.key,
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuideProfileCubit, GuideProfileState>(
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
          deleteIcon: const Icon(
            Icons.close,
            color: AppColors.primary2,
          ),
          onDeleted: state.inEditLangusgesMode
              ? () {
                  context.read<GuideProfileCubit>().removeLanguage(language);
                }
              : null,
        );
      },
    );
  }
}
