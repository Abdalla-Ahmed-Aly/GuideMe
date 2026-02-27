import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_lotties.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:lottie/lottie.dart';

class VerificationSuccessHeader extends StatelessWidget {
  const VerificationSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      width: 330.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffDD7B03).withValues(alpha: 0.3),
          width: 7,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              AppLotties.success,
              height: 150.h,
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffF2930D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                context.l10n.verifiedBadge,
                style: AppTextStyles.poppinsSemiBold16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
