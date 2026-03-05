import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'profile_language_chip.dart';

class ProfileLanguagesSection extends StatelessWidget {
  const ProfileLanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.l10n.languages,
                style: AppTextStyles.interBold18,
              ),

              const Spacer(),

              // Add button
              Row(
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

              const SizedBox(width: 16),

              const Icon(
                Icons.edit_outlined,
                color: AppColors.natural6,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Languages list
          const Wrap(
            spacing: 8,
            children: [
              ProfileLanguageChip(),
              ProfileLanguageChip(),
              ProfileLanguageChip(),
              ProfileLanguageChip(),
            ],
          ),
        ],
      ),
    );
  }
}
