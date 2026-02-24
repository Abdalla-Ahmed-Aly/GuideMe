
import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xffFFA537)),
            image: const DecorationImage(
              image: AssetImage(AppImages.profileImageTest),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Marhaban!',
              style: AppTextStyles.poppinsRegular14.copyWith(
                color: const Color(0xff936B24),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text('Menna Ramdan', style: AppTextStyles.poppinsMedium18),
          ],
        ),
      ],
    );
  }
}
