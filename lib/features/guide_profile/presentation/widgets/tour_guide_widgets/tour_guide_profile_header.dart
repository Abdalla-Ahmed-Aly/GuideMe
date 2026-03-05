import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TourGuideProfileHeader extends StatelessWidget {
  const TourGuideProfileHeader({super.key});

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
            ),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(64.h),
            child: Image.asset(
              AppImages.profileImageTest,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          "Omar Yasser",
          style: AppTextStyles.interBold24,
        ),

        const SizedBox(height: 4),

        // Location and Rating
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Location
            const Icon(
              Icons.location_on_outlined,
              color: Color(0xff64748B),
              size: 20,
            ),

            const SizedBox(width: 8),

            Text(
              "Cairo, Egypt",
              style: AppTextStyles.interRegular14.copyWith(
                color: const Color(0xff64748B),
              ),
            ),

            const SizedBox(width: 12),

            Text(
              "•",
              style: AppTextStyles.interRegular14.copyWith(
                color: const Color(0xff64748B),
              ),
            ),

            const SizedBox(width: 12),

            // Rating
            const Icon(
              Icons.star_border,
              color: Color(0xffEAB308),
              size: 20,
            ),

            const SizedBox(width: 8),

            Text(
              "4.5",
              style: AppTextStyles.interBold14,
            ),

            const SizedBox(width: 8),

            Text(
              "(120 reviews)",
              style: AppTextStyles.interRegular14.copyWith(
                color: const Color(0xff94A3B8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
