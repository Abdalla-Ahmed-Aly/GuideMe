import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class StartChattingWidget extends StatelessWidget {
  const StartChattingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 100,
            color: AppColors.primary2.withValues(alpha: 0.7),
          ),
      
          Text(
            context.l10n.startTheConversation,
            style: AppTextStyles.interBold18,
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.sendAMessageToGetThingsGoing,
            style: AppTextStyles.interRegular14,
          ),
        ],
      ),
    );
  }
}
