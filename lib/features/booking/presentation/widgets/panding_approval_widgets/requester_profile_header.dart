import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class RequesterProfileHeaderSection extends StatelessWidget {
  const RequesterProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 21),
      child: Row(
        children: [
          const UserInfoHeader(),
          const SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Text(
                'Johnathan Doe',
                style: AppTextStyles.poppinsMedium18,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'United States',
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff7C6965),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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

        Positioned(
          right: 0,
          bottom: 2,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
