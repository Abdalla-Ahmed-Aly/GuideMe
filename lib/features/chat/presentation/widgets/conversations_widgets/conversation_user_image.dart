import 'package:flutter/material.dart';
import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class ConversationUserImage extends StatelessWidget {
  const ConversationUserImage({
    super.key,
    required this.user,
  });
  final UserInfoEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: user.photo != null
          ? CustomNetworkImage(
              imageUrl: user.photo!.url!,
              fit: BoxFit.cover,
            )
          : const Icon(
              Icons.person_outline,
              color: AppColors.primary2,
              size: 28,
            ),
    );
  }
}
