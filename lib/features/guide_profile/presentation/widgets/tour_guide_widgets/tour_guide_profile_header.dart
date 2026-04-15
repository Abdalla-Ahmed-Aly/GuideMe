import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TourGuideProfileHeader extends StatelessWidget {
  final UserEntity user;
  const TourGuideProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image
        Container(
          width: 128.h,
          height: 128.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffF2930D).withValues(alpha: 0.2),
              width: 6,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            shape: BoxShape.circle,
          ),
          child: user.photoUrl != null
              ? Image.network(user.photoUrl!)
              : const Icon(
                  Icons.person_outline_outlined,
                  size: 64,
                  color: AppColors.primary2,
                ),
        ),

        const SizedBox(height: 12),

        Text(
          user.name ?? context.l10n.unknownName,
          style: AppTextStyles.interBold24,
        ),
      ],
    );
  }
}
