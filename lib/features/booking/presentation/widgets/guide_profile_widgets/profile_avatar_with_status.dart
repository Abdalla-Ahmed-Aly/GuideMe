import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class ProfileAvatarWithStatus extends StatelessWidget {
  const ProfileAvatarWithStatus({
    super.key,
    required this.imageUrl,
    required this.isOnline,
  });
  final String? imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 144,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary2.withValues(alpha: 0.1),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: imageUrl != null
          ? CustomNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.cover,
            )
          : const Icon(Icons.person_outline, size: 100),
    );
  }
}
