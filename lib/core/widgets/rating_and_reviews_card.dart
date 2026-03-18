import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';

class RatingAndReviewsCard extends StatelessWidget {
  const RatingAndReviewsCard({
    super.key,
    required this.numberOfReviews,
    required this.rating,
    required this.reviews,
  });
  final int numberOfReviews;
  final double rating;
  final Map<String, num> reviews;

  int getRating(String key) {
    return (((reviews[key]?.toInt() ?? 0) / numberOfReviews) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffCC914A).withValues(alpha: .4),
        ),
      ),
      child: Row(
        children: [
          // Rating & reviews count
          Column(
            children: [
              Text(
                "$rating",
                style: AppTextStyles.poppinsBold36,
              ),

              const SizedBox(height: 4),

              DynamicRatingStars(rating: rating),

              const SizedBox(height: 4),
              Text(
                "$numberOfReviews ${context.l10n.reviews}",
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: const Color(0xff64748B),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, getRating("5")),
                const SizedBox(height: 4),
                _buildRatingBar(4, getRating("4")),
                const SizedBox(height: 4),
                _buildRatingBar(3, getRating("3")),
                const SizedBox(height: 4),
                _buildRatingBar(2, getRating("2")),
                const SizedBox(height: 4),
                _buildRatingBar(1, getRating("1")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, int percentage) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
          child: Center(
            child: Text(
              stars.toString(),
              style: AppTextStyles.poppinsMedium14.copyWith(
                color: const Color(0xff64748B),
              ),
            ),
          ),
        ),

        const SizedBox(width: 4),

        // Progress bar
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 10,
            value: percentage.toDouble() / 100,
            color: AppColors.primary2,
            backgroundColor: const Color(0xffFED59B),
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        const SizedBox(width: 4),

        // Percentage text
        SizedBox(
          width: 32.w,
          child: Text(
            "$percentage%",
            textAlign: TextAlign.right,
            style: AppTextStyles.poppinsMedium14.copyWith(
              color: const Color(0xff64748B),
            ),
          ),
        ),
      ],
    );
  }
}
