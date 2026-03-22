import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class RecentWidget extends StatelessWidget {
  const RecentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF2930D),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          context.l10n.recent,
          style: AppTextStyles.poppinsRegular14.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
