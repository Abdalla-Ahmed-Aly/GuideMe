import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AvailabilityAndPricingHeader extends StatelessWidget {
  const AvailabilityAndPricingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title & progress data
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.stepOf(3, 4),
              style: AppTextStyles.poppinsRegular18.copyWith(
                color: const Color(0xffF2920A),
              ),
            ),

            Text(
              context.l10n.percentComplete(75),
              style: AppTextStyles.poppinsRegular18.copyWith(
                color: const Color(0xffF2920A),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // progress bar
        LinearProgressIndicator(
          minHeight: 10,
          value: .75,
          color: const Color(0xffF2930D),
          backgroundColor: const Color(0xffFED59B),
          borderRadius: BorderRadius.circular(20),
        ),
      ],
    );
  }
}
