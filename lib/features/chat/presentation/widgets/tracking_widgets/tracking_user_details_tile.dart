import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TrackingUserDetailsTile extends StatelessWidget {
  const TrackingUserDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AppImages.profileImageTest),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Omar Yasser",
                style: AppTextStyles.poppinsMedium16,
              ),

              const SizedBox(height: 2),

              Text(
                "Tourist",
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff9D9D9D),
                ),
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call,
            color: Color(0xffF2930D),
            size: 28,
          ),
        ),
      ],
    );
  }
}
