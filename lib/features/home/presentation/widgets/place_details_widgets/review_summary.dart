import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/rating_bar.dart';

class ReviewSummary extends StatelessWidget {
  final PlaceEntity place;
  const ReviewSummary({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final reviews = place.reviewsSummary ?? {};
    final totalReviews = place.reviewsCount;

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
            crossAxisAlignment: CrossAxisAlignment.start,
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.reviewSummary,
                    style: TextStyle(
                      fontSize: 20.fs,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  const SizedBox(height: 2),

                  DynamicRatingStars(
                    rating: place.rating,
                    iconColor: const Color(0xffFFDA44),
                  ),
                ],
              ),

              SizedBox(width: 6.p),
            ],
          ),

          const SizedBox(height: 10),

          RatingBar(
            number: 5,
            value: (reviews['5'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews),
          ),
          RatingBar(
            number: 4,
            value: (reviews['4'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews),
          ),
          RatingBar(
            number: 3,
            value: (reviews['3'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews),
          ),
          RatingBar(
            number: 2,
            value: (reviews['2'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews),
          ),
          RatingBar(
            number: 1,
            value: (reviews['1'] ?? 0) / (totalReviews == 0 ? 1 : totalReviews),
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
