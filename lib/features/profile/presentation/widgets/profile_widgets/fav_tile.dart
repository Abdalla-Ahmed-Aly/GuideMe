import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class FavTile extends StatelessWidget {
  const FavTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.favoritesScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.natural2,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                context.l10n.favorites,
                style: AppTextStyles.poppinsSemiBold18,
              ),
            ),

            const SizedBox(width: 12),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.natural3,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
