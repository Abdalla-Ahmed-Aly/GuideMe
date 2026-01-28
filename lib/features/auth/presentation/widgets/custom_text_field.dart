import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.labelText,
  });
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 18.p),
        labelStyle: AppTextStyles.interRegular16.copyWith(
          color: AppColors.natural1,
        ),
        hintStyle: AppTextStyles.interRegular16.copyWith(
          color: AppColors.natural1,
        ),
        fillColor: AppColors.white,
        labelText: labelText,
        filled: true,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(
        color: AppColors.natural2,
      ),
    );
  }
}
