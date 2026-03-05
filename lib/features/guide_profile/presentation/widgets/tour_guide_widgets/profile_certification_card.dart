import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ProfileCertificationCard extends StatelessWidget {
  const ProfileCertificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary2.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary2.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(
              AppIcons.diploma,
              width: 20,
              height: 20,
            ),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Licensed Tour Guide",
                softWrap: true,
                style: AppTextStyles.interBold16,
              ),

              // const SizedBox(height: 6),
              Text(
                "Ministry of Tourism & Antiquities",
                style: AppTextStyles.interRegular14.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),

              // const SizedBox(height: 6),
              Text(
                "Issued Jan 2012 • Valid until Dec 2026",
                style: AppTextStyles.interRegular12.copyWith(
                  color: const Color(0xff94A3B8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
