import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';

class ProfileAvatarWithStatus extends StatelessWidget {
  const ProfileAvatarWithStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.p),
          child: const CircleAvatar(
            radius: 72,
            backgroundColor: Color(0xffC4C4C4),
          ),
        ),

        Positioned(
          bottom: 5.p,
          right: 5.p,
          child: Container(
            width: 27.w,
            height: 29.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff22C322),
            ),
          ),
        ),

        Positioned(
          top: 20,
          right: -110.p,
          child: const Icon(
            Icons.chat_outlined,
            size: 28,
          ),
        ),
      ],
    );
  }
}
