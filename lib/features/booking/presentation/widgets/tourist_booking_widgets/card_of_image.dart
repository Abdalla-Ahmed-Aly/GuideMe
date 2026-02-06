import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';

class CardOfImage extends StatelessWidget {
  const CardOfImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.bookDetailsScreen);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.p),
        width: 384.w,
        height: 175.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(
              AppImages.famousTripTest,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
