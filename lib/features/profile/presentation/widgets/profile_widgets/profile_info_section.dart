import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/profile/presentation/widgets/profile_widgets/profile_info_item.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 16),

          // Image
          CircleAvatar(
            radius: 80.h,
            backgroundImage: const AssetImage(AppImages.profileImageTest),
          ),

          const SizedBox(height: 16),

          // Name
          Text(
            'John Doe',
            style: AppTextStyles.poppinsSemiBold26,
          ),

          const SizedBox(height: 32),

          // Email
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: ProfileInfoItem(
              label: context.l10n.email,
              value: "John Doe@gmail.com",
            ),
          ),

          const SizedBox(height: 14),

          // Name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: ProfileInfoItem(
              label: context.l10n.name,
              value: "John Doe",
            ),
          ),

          const SizedBox(height: 14),

          // Phone Number
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: ProfileInfoItem(
              label: context.l10n.phone,
              value: "+1 (978) 804-4104",
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
