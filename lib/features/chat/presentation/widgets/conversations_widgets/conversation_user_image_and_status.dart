import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';

class ConversationUserImageAndStatus extends StatelessWidget {
  const ConversationUserImageAndStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffFFA537),
              width: 2,
            ),
            image: const DecorationImage(
              image: AssetImage(AppImages.profileImageTest),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: const Color(0xffF2930D),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
