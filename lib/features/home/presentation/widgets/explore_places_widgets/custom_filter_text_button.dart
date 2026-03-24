import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CustomFilterTextButton extends StatelessWidget {
  const CustomFilterTextButton({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelected,
  });
  final String text;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppTextStyles.familyMontserrat,
          fontSize: 16.fs,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.blue : AppColors.black,
        ),
      ),
    );
  }
}
