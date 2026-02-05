import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';

class ChangeImageSection extends StatelessWidget {
  const ChangeImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 57,
          backgroundImage: AssetImage(AppImages.profileImageTest),
        ),

        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ],
            ),
            child: SvgPicture.asset(
              AppIcons.camera,
            ),
          ),
        ),
      ],
    );
  }
}
