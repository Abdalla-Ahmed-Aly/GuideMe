import 'package:flutter/material.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      width: 144,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffFFA537),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: user.photoUrl == null
          ? const Icon(
              Icons.person_outline,
              color: AppColors.primary2,
              size: 60,
            )
          : CustomNetworkImage(
              imageUrl: user.photoUrl!,
              fit: BoxFit.cover,
            ),
    );
  }
}
