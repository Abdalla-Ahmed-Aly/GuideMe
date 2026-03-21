import 'package:flutter/material.dart';
import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/rating_bar.dart';

class ReviewSummary extends StatelessWidget {
  final PlaceEntity place;
  const ReviewSummary({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final reviews = place.reviewsSummary ?? {};
    final totalReviews = place.reviewsCount ?? 0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.p),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Rating and Review summary
          Row(
            children: [
              SizedBox(width: 6.p),

              Text(
                place.rating.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 20.fs,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                context.l10n.reviewSummary,
                style: TextStyle(
                  fontSize: 20.fs,
                  fontWeight: FontWeight.w300,
                ),
              ),

              SizedBox(width: 6.p),
            ],
          ),

          const SizedBox(height: 4),

          // Five Stars
          Row(
            children: [
              const SizedBox(width: 46),
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star_rounded,
                  color: i < place.rating.floor()
                      ? const Color(0xffFFDA44)
                      : Colors.grey,
                  size: 18.ic,
                ),

              SizedBox(width: 46.p),
            ],
          ),

          const SizedBox(height: 10),

          RatingBar(number: 5, value: (reviews['5'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews)),
          RatingBar(number: 4, value: (reviews['4'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews)),
          RatingBar(number: 3, value: (reviews['3'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews)),
          RatingBar(number: 2, value: (reviews['2'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews)),
          RatingBar(number: 1, value: (reviews['1'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews)),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
