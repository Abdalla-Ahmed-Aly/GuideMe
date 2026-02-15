import 'package:flutter/material.dart';

class ProfileAvatarWithStatus extends StatelessWidget {
  const ProfileAvatarWithStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: CircleAvatar(
            radius: 72,
            backgroundColor: Color(0xffC4C4C4),
          ),
        ),

        Positioned(
          bottom: 6,
          right: 10,
          child: Container(
            width: 27,
            height: 29,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff22C322),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
