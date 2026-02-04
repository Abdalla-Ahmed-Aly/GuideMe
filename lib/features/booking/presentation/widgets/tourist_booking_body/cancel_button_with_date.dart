import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CancelButtonWithDate extends StatelessWidget {
  const CancelButtonWithDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23.p),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.p, right: 5.p),
            child: SvgPicture.asset(AppIcons.calendar),
          ),
          Padding(
            padding: EdgeInsets.only(right: 19.p),
            child: Text(
              '14 Nov-22Nov',
              style: AppTextStyles.interRegular14.copyWith(
                color: const Color(0xff7D848D),
              ),
            ),
          ),

          Container(
            width: 237.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: const Color(0xffFF0000),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                'cancel',
                style: AppTextStyles.interBold14.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
