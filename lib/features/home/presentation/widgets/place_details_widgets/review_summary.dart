import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/rating_bar.dart';

class ReviewSummary extends StatelessWidget {
  const ReviewSummary({super.key});

  @override
  Widget build(BuildContext context) {
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
                "4.7",
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
                  color: const Color(0xffFFDA44),
                  size: 18.ic,
                ),

              SizedBox(width: 46.p),
            ],
          ),

          const SizedBox(height: 10),

          const RatingBar(number: 5, value: 0.8),
          const RatingBar(number: 4, value: 0.4),
          const RatingBar(number: 3, value: 0.2),
          const RatingBar(number: 2, value: 0),
          const RatingBar(number: 1, value: 0),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
