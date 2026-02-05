import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 22,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final double iconSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.interRegular18,
        ),

        InkWell(
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Icon(
            icon,
            size: iconSize,
            color: AppColors.natural3,
          ),
        ),
      ],
    );
  }
}
