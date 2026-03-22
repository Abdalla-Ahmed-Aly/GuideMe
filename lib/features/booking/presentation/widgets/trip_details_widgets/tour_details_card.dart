import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TourDetailsCard extends StatelessWidget {
  const TourDetailsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.subValue,
  });
  final String title;
  final String value;
  final String subValue;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffFEF4E6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: icon,
          ),

          const SizedBox(height: 6),

          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.poppinsSemiBold14.copyWith(
              color: const Color(0xff8B94A2),
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.poppinsMedium16,
          ),

          const SizedBox(height: 1),

          Text(
            subValue,
            style: AppTextStyles.poppinsRegular14.copyWith(
              color: const Color(0xff956B00),
            ),
          ),
        ],
      ),
    );
  }
}
