import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TimeSendCode extends StatelessWidget {
  const TimeSendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.p),
          child: Text(
            context.l10n.code,
            style: AppTextStyles.interSemiBold16.copyWith(
              color: AppColors.natural3,
            ),
          ),
        ),
        Text(
          "00:20",
          style: AppTextStyles.interRegular16.copyWith(
            color: AppColors.natural3,
          ),
        ),
      ],
    );
  }
}
