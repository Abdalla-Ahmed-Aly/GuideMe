import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookingProfile extends StatelessWidget {
  const BookingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffFFA537),
            ),
            image: const DecorationImage(
              image: AssetImage(AppImages.profileImageTest),
            ),
          ),
        ),

        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              context.l10n.welcome,
              style: AppTextStyles.poppinsMedium14.copyWith(
                color: const Color(0xff936B24),
              ),
            ),
            Text(
              "Omar Yasser",
              style: AppTextStyles.poppinsRegular18,
            ),
          ],
        ),
      ],
    );
  }
}
