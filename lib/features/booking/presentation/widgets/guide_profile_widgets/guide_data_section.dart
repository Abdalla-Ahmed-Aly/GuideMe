import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_info.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/profile_avatar_with_status.dart';

class GuideDataSection extends StatelessWidget {
  const GuideDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const ProfileAvatarWithStatus(),

          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Experienced Egyptologist & Licensed Tour",
              style: AppTextStyles.interMedium14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              "Guide, Cairo",
              style: AppTextStyles.interMedium14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SvgPicture.asset(AppIcons.rating),
          ),

          const SizedBox(height: 18),

          const GuideInfo(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
