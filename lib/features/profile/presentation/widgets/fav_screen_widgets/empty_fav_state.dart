import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class EmptyFavState extends StatelessWidget {
  const EmptyFavState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_add_outlined,
              size: 120,
              color: AppColors.primary2.withValues(alpha: .5),
            ),

            const SizedBox(height: 8),

            Text(
              context.l10n.favoritesEmpty,
              style: AppTextStyles.poppinsSemiBold18,
            ),

            const SizedBox(height: 4),

            Text(
              context.l10n.favoritesEmptyDesc,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsRegular14.copyWith(
                color: AppColors.natural4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
