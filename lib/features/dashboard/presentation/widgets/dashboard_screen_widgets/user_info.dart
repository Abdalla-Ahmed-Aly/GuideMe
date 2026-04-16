import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(
    this.imageUrl, {
    super.key,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xffFFA537)),
      ),
      child: (imageUrl != null && imageUrl!.isNotEmpty)
          ? CachedNetworkImage(imageUrl: imageUrl!, fit: BoxFit.cover)
          : const Icon(
              Icons.person_outline_rounded,
              color: AppColors.primary2,
              size: 30,
            ),
    );
  }
}
