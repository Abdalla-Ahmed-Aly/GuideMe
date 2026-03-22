import 'package:flutter/material.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class ProfileAvatarWithStatus extends StatelessWidget {
  const ProfileAvatarWithStatus({
    super.key,
    required this.imageUrl,
    required this.isOnline,
  });
  final String imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 144,
          height: 144,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CustomNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        if (isOnline)
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
