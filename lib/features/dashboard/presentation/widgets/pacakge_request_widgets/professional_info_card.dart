import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ProfessionalInfoCard extends StatelessWidget {
  const ProfessionalInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subValue,
    required this.icon,
  });
  final String title;
  final String value;
  final String subValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary2.withValues(alpha: .3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary2.withValues(alpha: .15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: AppColors.primary2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppTextStyles.poppinsSemiBold14.copyWith(
              color: const Color(0xff9E9E9E),
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
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.poppinsRegular14.copyWith(
              color: const Color(0xff956B00),
            ),
          ),
        ],
      ),
    );
  }
}
