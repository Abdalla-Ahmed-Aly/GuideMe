
import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';


class ShiftTimeField extends StatelessWidget {
  const ShiftTimeField({
    super.key,
    required this.time,
    required this.colorbackground,
    required this.width,
    required this.colorborder,
    required this.time1,
    required this.textcolor,
  });
  final String time;
  final String time1;
  final Color colorbackground;
  final Color colorborder;
  final double width;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      decoration: BoxDecoration(
        color: colorbackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorborder, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time1,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: textcolor,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                time,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: textcolor,
                ),
              ),
            ],
          ),
          Image.asset(
            AppImages.clock,
            width: 24,
          ),
        ],
      ),
    );
  }
}
