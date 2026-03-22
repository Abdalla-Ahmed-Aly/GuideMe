import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PackageTotalPriceSection extends StatelessWidget {
  const PackageTotalPriceSection({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary2.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primary2.withValues(alpha: .3),
        ),
      ),
      child: Row(
        children: [
          // texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.totalPrice,
                  style: AppTextStyles.poppinsSemiBold16.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  context.l10n.forAllPersons,
                  style: AppTextStyles.poppinsRegular14.copyWith(
                    color: AppColors.primary400,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "$totalPrice ${context.l10n.egp}",
            style: AppTextStyles.poppinsSemiBold28.copyWith(
              color: AppColors.primary2,
            ),
          ),
        ],
      ),
    );
  }
}
