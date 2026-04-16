import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
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
    this.loadWidth,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final double? radius;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? loadWidth;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final double normalWidth = width ?? context.screenWidth;
    final double loadingWidth = loadWidth ?? 100;

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
      onPressed: isLoading ? null : onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: isLoading
            ? const SizedBox(
                key: ValueKey("loading"),
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary2,
                  ),
                ),
              )
            : Text(
                key: const ValueKey("text"),
                text,
                style:
                    textStyle ??
                    AppTextStyles.poppinsSemiBold16.copyWith(
                      color: textColor ?? const Color(0xffF4A60E),
                    ),
              ),
      ),
    );
  }
}
