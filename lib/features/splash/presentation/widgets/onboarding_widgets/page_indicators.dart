import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({super.key, required this.currentPage});
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Line(isActive: currentPage >= 0),
        Line(isActive: currentPage >= 1),
        Line(isActive: currentPage >= 2),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: 18.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.primary50,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
