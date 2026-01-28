import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Colors.white,
          border: Border.all(
            color: AppColors.natural2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.primary,
            size: 22.ic,
          ),
        ),
      ),
    );
  }
}
