import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/profile_avatar_with_status.dart';

class GuideProfileHeaderSection extends StatelessWidget {
  const GuideProfileHeaderSection({
    super.key,
    required this.guide,
  });

  final UserEntity guide;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // profile image and status
        ProfileAvatarWithStatus(
          imageUrl: guide.photoUrl,
          isOnline: guide.isOnline ?? false,
        ),

        const SizedBox(height: 12),

        // guide name
        Text(
          guide.name ?? context.l10n.unknownGuide,
          style: AppTextStyles.poppinsBold20,
        ),

        const SizedBox(height: 4),

        // guide bio
        Text(
          guide.bio ?? "",
          textAlign: TextAlign.center,
          style: AppTextStyles.interMedium14.copyWith(
            color: AppColors.natural3,
          ),
        ),

        const SizedBox(height: 2),

        // location
        Text.rich(
          TextSpan(
            children: [
              const WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.location_on,
                  size: 18,
                  color: AppColors.primary2,
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: guide.location ?? context.l10n.thereIsNoLocation,
                style: AppTextStyles.interMedium14.copyWith(
                  color: AppColors.natural3,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
