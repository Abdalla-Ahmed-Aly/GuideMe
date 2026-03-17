import 'package:flutter/material.dart';

class DynamicRatingStars extends StatelessWidget {
  const DynamicRatingStars({super.key, required this.rating});
  final double rating;

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
          (index) => const Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 18,
          ),
        ),

        // Half star
        if (hasHalfStar)
          const Icon(Icons.star_half_rounded, color: Colors.amber, size: 18),

        // Empty stars
        ...List.generate(
          emptyStars,
          (index) => const Icon(
            Icons.star_border_rounded,
            color: Colors.amber,
            size: 18,
          ),
        ),
      ],
    );
  }
}
