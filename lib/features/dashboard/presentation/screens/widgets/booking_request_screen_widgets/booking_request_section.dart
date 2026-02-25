import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookingRequestSection extends StatelessWidget {
  const BookingRequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(child: ProfileTouirsts()),
          Text(
            'Ahmed Ali',
            style: AppTextStyles.poppinsRegular18.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 51,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Professional Information',
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTouirsts extends StatelessWidget {
  const ProfileTouirsts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppImages.profileImageTest),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 1,
          right: 8,
          child: Container(
            width: 42,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(AppImages.correcting),
          ),
        ),
      ],
    );
    ;
  }
}
