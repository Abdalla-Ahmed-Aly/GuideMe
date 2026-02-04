import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PickUpPointField extends StatelessWidget {
  const PickUpPointField({super.key, this.text, this.icon});
  final String? text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.p),
      child: Container(
        width: 362,
        height: 47,
        decoration: BoxDecoration(
          color: const Color(0xff8988887D),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11, right: 8),
              child: Icon(
                icon,
                // Icons.access_time,
                color: AppColors.natural4,
              ),
            ),
            Text(
              text!,
              style: AppTextStyles.interBold14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
