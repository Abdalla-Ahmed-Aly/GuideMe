import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/rating_row.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/data_response_model.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/rating_distribution__response_model.dart';

class FeedBackTravel extends StatelessWidget {
  const FeedBackTravel({
    super.key,
    required this.data,
    required this.ratingDistribution,
  });
  final Data data;
  final RatingDistribution ratingDistribution;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  data.averageRating.toString(),
                  style: AppTextStyles.poppinsRegular38,
                ),
                const SizedBox(
                  height: 5,
                ),
                DynamicRatingStars(
                  rating: 4,

                  size: 18.w,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  data.totalReviews.toString(),
                  style: AppTextStyles.poppinsSemiBold14,
                ),
                const SizedBox(
                  height: 38,
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: 6.p),
              child: Column(
                children: [
                  RatingRow(
                    rate: 5,
                    percent: calculatePercent(
                      ratingDistribution.five,
                      data.totalReviews,
                    ),
                  ),
                  RatingRow(
                    rate: 4,
                    percent: calculatePercent(
                      ratingDistribution.four,
                      data.totalReviews,
                    ),
                  ),
                  RatingRow(
                    rate: 3,
                    percent: calculatePercent(
                      ratingDistribution.three,
                      data.totalReviews,
                    ),
                  ),
                  RatingRow(
                    rate: 2,
                    percent: calculatePercent(
                      ratingDistribution.two,
                      data.totalReviews,
                    ),
                  ),
                  RatingRow(
                    rate: 1,
                    percent: calculatePercent(
                      ratingDistribution.one,
                      data.totalReviews,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double calculatePercent(int count, int total) {
  if (total == 0) return 0;
  return count / total;
}
