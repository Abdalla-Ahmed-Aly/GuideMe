import 'package:flutter/material.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class ConversationUserImageAndStatus extends StatelessWidget {
  const ConversationUserImageAndStatus({
    super.key,
    required this.user,
  });
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 50,
          height: 50,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffFFA537),
              strokeAlign: BorderSide.strokeAlignOutside,
              width: 2,
            ),
          ),
          child: user.photoUrl != null
              ? CustomNetworkImage(
                  imageUrl: user.photoUrl!,
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.person_outline,
                  color: AppColors.primary2,
                  size: 28,
                ),
        ),
        if (user.isOnline ?? false)
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
