
import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookingActionButtons extends StatelessWidget {
  const BookingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              maximumSize: const Size(173, 44),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color(0xffA3A3A3),
                ),
              ),
            ),
            onPressed: () {},
            child: Center(
              child: Text(
                context.l10n.decline,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              maximumSize: const Size(173, 44),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
            ),
            onPressed: () {},
            child: Center(
              child: Text(
                context.l10n.accept,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
