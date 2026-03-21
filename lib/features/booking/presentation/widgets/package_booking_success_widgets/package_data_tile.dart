import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PackageDataTile extends StatelessWidget {
  const PackageDataTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary2.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary2,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.poppinsSemiBold16.copyWith(
              color: AppColors.primary800,
            ),
          ),
        ),

        const SizedBox(width: 8),
        Text(
          value,
          style: AppTextStyles.poppinsSemiBold18.copyWith(
            color: AppColors.primary2,
          ),
        ),
      ],
    );
  }
}
