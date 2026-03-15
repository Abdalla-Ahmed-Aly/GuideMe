import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.radius,
    this.textStyle,
    this.isLoading = false,
    this.prefixIcon,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textStyle;
  final bool isLoading;
  final Widget? prefixIcon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final double normalWidth = width ?? context.screenWidth;
    final double loadingWidth = 100;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isLoading ? loadingWidth : normalWidth,
      height: height ?? 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!,
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        text,
                        style: textStyle ?? AppTextStyles.interSemiBold16,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
