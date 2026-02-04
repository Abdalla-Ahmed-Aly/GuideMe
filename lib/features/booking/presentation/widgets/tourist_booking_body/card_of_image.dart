import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';

class CardOfImage extends StatelessWidget {
  const CardOfImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.p, vertical: 8.p),
      width: 384.w,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(
            AppImages.famousTripTest,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
