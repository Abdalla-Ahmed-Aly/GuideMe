import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class GuideLocationSection extends StatelessWidget {
  const GuideLocationSection({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.location,
            style: AppTextStyles.interBold18,
          ),

          const SizedBox(height: 12),

          user.location == null || user.location!.isEmpty
              ? Text(
                  context.l10n.noLocationYet,
                  style: AppTextStyles.interBold16.copyWith(
                    color: const Color(0xff475569),
                  ),
                )
              : Text(
                  user.location!,
                  style: AppTextStyles.interRegular16.copyWith(
                    color: const Color(0xff475569),
                  ),
                ),
        ],
      ),
    );
  }
}
