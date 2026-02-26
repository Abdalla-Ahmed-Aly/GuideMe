import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class EarningsSummaryCard extends StatelessWidget {
  const EarningsSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: 0.1),
        border: Border.all(color: const Color(0xffCC914A)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.yourEarnings,
              style: AppTextStyles.poppinsSemiBold18,
            ),
          ),
          Text(
            r'$108.00',
            style: AppTextStyles.poppinsSemiBold26.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
