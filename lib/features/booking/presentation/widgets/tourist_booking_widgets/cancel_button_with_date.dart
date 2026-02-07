import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class CancelButtonWithDate extends StatelessWidget {
  const CancelButtonWithDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.calendar),

        const SizedBox(width: 6),

        Text(
          '14 Nov-22Nov',
          style: AppTextStyles.interRegular14.copyWith(
            color: const Color(0xff7D848D),
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {
            showCancelDialog(context);
          },
          child: Container(
            width: 237.w,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xffFF0000),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                'Cancel',
                style: AppTextStyles.interBold14.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showCancelDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            context.l10n.cancelTrip,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(context.l10n.areYouSureToCancel),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                context.pop();
              },
              child: Text(context.l10n.backMsg),
            ),
            AppButton(
              width: 100,
              height: 38,
              onPressed: () {
                context.pop();
              },
              text: context.l10n.yes,
              backgroundColor: Colors.red,
              textStyle: AppTextStyles.interSemiBold16.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        );
      },
    );
  }
}
