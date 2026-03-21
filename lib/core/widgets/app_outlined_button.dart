import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.width,
    this.radius,
  });
  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final double? radius;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width ?? context.screenWidth, height ?? 48),
        side: BorderSide(
          color: borderColor ?? const Color(0xffFF0000).withValues(alpha: .5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radius ?? 50),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            textStyle ??
            AppTextStyles.poppinsSemiBold16.copyWith(
              color: textColor ?? const Color(0xffF4A60E),
            ),
      ),
    );
  }
}
