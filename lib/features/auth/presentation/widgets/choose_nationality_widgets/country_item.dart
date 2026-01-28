import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({super.key, this.isSelected = false});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      margin: EdgeInsets.only(left: 10.m, right: 10.m, bottom: 6.m),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffF4F5F6) : Colors.transparent,
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(
          color: isSelected ? AppColors.natural2 : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.p),
            child: Image.asset(AppImages.country),
          ),
          8.horizontalSpace,
          Text(
            "English",
            style: AppTextStyles.interMedium16,
          ),
          const Spacer(),
          isSelected
              ? Container(
                  width: 20.w,
                  height: 20.h,
                  margin: EdgeInsets.all(10.m),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: AppColors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
