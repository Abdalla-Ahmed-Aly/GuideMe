import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class DynamicRatingStars extends StatelessWidget {
  const DynamicRatingStars({
    super.key,
    required this.rating,
    this.size,
    this.iconColor,
  });
  final double rating;
  final double? size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full stars
        ...List.generate(
          fullStars,
          (index) => Icon(
            Icons.star_rounded,
            color: iconColor ?? AppColors.primary2,
            size: size ?? 18,
          ),
        ),

        // Half star
        if (hasHalfStar)
          Icon(
            Icons.star_half_rounded,
            color: iconColor ?? AppColors.primary2,
            size: size ?? 18,
          ),

        // Empty stars
        ...List.generate(
          emptyStars,
          (index) => Icon(
            Icons.star_border_rounded,
            color: iconColor ?? AppColors.primary2,
            size: size ?? 18,
          ),
        ),
      ],
    );
  }
}
