import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ProfileLanguageChip extends StatelessWidget {
  const ProfileLanguageChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        "English",
        style: AppTextStyles.interMedium14.copyWith(
          color: AppColors.primary2,
        ),
      ),
      deleteIcon: const Icon(
        Icons.close,
        color: AppColors.primary2,
      ),
      onDeleted: () {},
    );
  }
}
