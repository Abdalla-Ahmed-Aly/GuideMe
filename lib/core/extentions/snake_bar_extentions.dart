import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

extension SnakeBarExtention on BuildContext {
  // Suucess snake bar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnakbar({
    required String message,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff009F00),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffC3F2BA),
                width: 6,
              ),
              color: const Color(0xff009F00),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              message,
              style: AppTextStyles.interSemiBold14,
            ),
          ),
        ],
      ),
    ),
  );

  // Error snake bar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnakbar({
    required String message,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xffEE3434),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              message,
              style: AppTextStyles.interSemiBold14,
            ),
          ),
        ],
      ),
    ),
  );
}
