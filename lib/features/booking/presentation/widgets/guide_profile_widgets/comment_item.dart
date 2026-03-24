import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';
import 'package:guide_me/core/shared/entities/review_entity.dart';
import 'package:intl/intl.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.review,
  });

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ReviewedProfile(review: review),

          const SizedBox(height: 16),

          DynamicRatingStars(
            rating: review.rating.toDouble(),
            size: 24,
          ),

          const SizedBox(height: 12),

          Text(
            review.comment,
            style: AppTextStyles.poppinsMedium14,
          ),
        ],
      ),
    );
  }
}

class _ReviewedProfile extends StatelessWidget {
  const _ReviewedProfile({
    required this.review,
  });

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary2,
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: CustomNetworkImage(
            imageUrl: review.touristPhoto,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.touristName,
                style: AppTextStyles.poppinsSemiBold18,
              ),

              const SizedBox(height: 4),

              Row(
                children: [
                  const Icon(
                    Icons.language,
                    size: 18,
                    color: Color(0xffB59A64),
                  ),

                  const SizedBox(width: 2),

                  Text(
                    DateFormat(
                      "MMM dd, yyyy hh:mm a",
                    ).format(review.createdAt),
                    style: AppTextStyles.poppinsRegular16.copyWith(
                      color: const Color(0xffB59A64),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
