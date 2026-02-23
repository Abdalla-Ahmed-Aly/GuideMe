import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SetupProgressHeader extends StatelessWidget {
  const SetupProgressHeader({
    super.key,
    required this.title,
    required this.currentStep,
    required this.percentage,
  });
  final String title;
  final int currentStep;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title & progress data
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.poppinsRegular18,
            ),

            Text(
              context.l10n.guideSetupStep(currentStep, percentage, 4),
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
          value: percentage / 100,
          color: const Color(0xffF2930D),
          backgroundColor: const Color(0xffFED59B),
          borderRadius: BorderRadius.circular(20),
        ),
      ],
    );
  }
}
