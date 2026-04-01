import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  const HomeSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      child: Text(
        title,
        style: AppTextStyles.poppinsBold18.copyWith(
          color: AppColors.blue,
        ),
      ),
    );
  }
}
