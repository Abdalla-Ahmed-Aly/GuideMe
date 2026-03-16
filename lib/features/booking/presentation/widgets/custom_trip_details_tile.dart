import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CustomTripDetailsTile extends StatelessWidget {
  const CustomTripDetailsTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final String title;
  final String value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.poppinsSemiBold14.copyWith(
                  color: const Color(0xff7C6965),
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppinsRegular16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
