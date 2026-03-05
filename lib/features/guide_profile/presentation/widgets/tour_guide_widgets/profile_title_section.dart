import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ProfileTitleSection extends StatelessWidget {
  const ProfileTitleSection({
    super.key,
    required this.title,
    required this.onAddPressed,
    required this.onEditPressed,
  });
  final String title;
  final void Function()? onAddPressed;
  final void Function()? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.interBold18,
        ),

        const Spacer(),

        // Add button
        GestureDetector(
          onTap: onAddPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add,
                color: AppColors.primary2,
                size: 20,
              ),

              const SizedBox(width: 4),

              Text(
                context.l10n.add,
                style: AppTextStyles.interBold14.copyWith(
                  color: AppColors.primary2,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        GestureDetector(
          onTap: onEditPressed,
          child: const Icon(
            Icons.edit_outlined,
            color: AppColors.natural6,
            size: 20,
          ),
        ),
      ],
    );
  }
}
