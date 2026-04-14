import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AboutSection extends StatelessWidget {
  final UserEntity user;
  const AboutSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.about,
                style: AppTextStyles.interBold18,
              ),

              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xff64748B),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          user.bio == null || user.bio!.isEmpty
              ? Text(
                  context.l10n.noBio,
                  style: AppTextStyles.interBold16.copyWith(
                    color: const Color(0xff475569),
                  ),
                )
              : Text(
                  user.bio!,
                  style: AppTextStyles.interRegular16.copyWith(
                    color: const Color(0xff475569),
                  ),
                ),
        ],
      ),
    );
  }
}
