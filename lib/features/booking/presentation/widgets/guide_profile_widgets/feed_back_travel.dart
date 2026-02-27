import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_rating_widget.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/rating_row.dart';

class FeedBackTravel extends StatelessWidget {
  const FeedBackTravel({
    super.key,
  });

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
                  '4.8',
                  style: AppTextStyles.poppinsRegular38,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomRatingWidget(color: Color(0xffDD7B03)),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '123 reviews',
                  style: AppTextStyles.poppinsRegular18,
                ),
                const SizedBox(
                  height: 38,
                ),
              ],
            ),
          ),
          const Flexible(
            child: Column(
              children: [
                RatingRow(rate: 5, percent: 0.80),
                RatingRow(rate: 4, percent: 0.12),
                RatingRow(rate: 3, percent: 0.05),
                RatingRow(rate: 2, percent: 0.02),
                RatingRow(rate: 1, percent: 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
