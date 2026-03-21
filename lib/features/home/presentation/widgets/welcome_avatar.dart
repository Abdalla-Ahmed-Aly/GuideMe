import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';

class WelcomeAvatar extends StatelessWidget {
  const WelcomeAvatar({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
        ),
        child: Stack(
          children: [
            // Close Button
            Positioned(
              top: 50.h,
              right: 28.w,
              child: Icon(
                Icons.close,
                size: 28.ic,
                color: Colors.black,
              ),
            ),

            // Avatar
            Positioned(
              bottom: 50.h,
              child: Image.asset(
                AppImages.welcomeAvatar,
                width: size.width,
                height: size.height * 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
