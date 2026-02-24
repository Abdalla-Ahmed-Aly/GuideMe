import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TourDetailCard extends StatelessWidget {
  const TourDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xffF6F2EB),
        border: Border.all(color: const Color(0xffF6F2EB)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.location,
                width: 15.w,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Giza Pyramids Private Tour',
                style: AppTextStyles.poppinsMedium14,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset(AppImages.timer1, width: 22.w),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Oct 12, 06:00 PM . 3 Hours',
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff936B24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
