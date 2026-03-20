import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.labelText,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType,
    this.border,
    this.hintColor,
    this.fillColor,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
  });
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final InputBorder? border;
  final Color? hintColor;
  final Color? fillColor;
  final void Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      style: AppTextStyles.interRegular16,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        labelStyle: AppTextStyles.interRegular16.copyWith(
          color: AppColors.natural1,
        ),
        hintStyle: AppTextStyles.interRegular16.copyWith(
          color: hintColor ?? AppColors.natural1,
        ),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        fillColor: fillColor,
      ),
    );
  }
}
