import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class TouristProfileImage extends StatelessWidget {
  const TouristProfileImage({
    super.key,
    this.imageUrl,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary2,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.cover,
            )
          : const Icon(
              Icons.person_outline_rounded,
              size: 80,
              color: AppColors.primary2,
            ),
    );
  }
}
