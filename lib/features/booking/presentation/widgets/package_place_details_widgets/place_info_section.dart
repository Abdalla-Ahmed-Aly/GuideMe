import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/rating_and_reviews_card.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_place_details_widgets/place_location_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_place_details_widgets/tags_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_place_details_widgets/tour_info_card.dart';

class PlaceInfoSection extends StatelessWidget {
  const PlaceInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final place = GoRouterState.of(context).extra as PlaceInfoEntity;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.p, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TagsSection(),

          const SizedBox(height: 8),

          Text(
            place.title,
            style: AppTextStyles.poppinsBold26,
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xff64748B),
                size: 20,
              ),

              const SizedBox(width: 4),

              Text(
                place.location?.name ?? context.l10n.thereIsNoLocation,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: const Color(0xff64748B),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.primary2,
                size: 22,
              ),

              const SizedBox(width: 4),

              Text(
                place.rating.toString(),
                style: AppTextStyles.poppinsBold20,
              ),

              const SizedBox(width: 8),

              Text(
                "(${place.reviewsCount} ${context.l10n.reviews})",
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: const Color(0xff64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const TourInfoCard(),

          const SizedBox(height: 24),

          Text(
            context.l10n.aboutThisPlace,
            style: AppTextStyles.poppinsBold20,
          ),

          const SizedBox(height: 8),

          Text(
            place.description ?? context.l10n.noDescriptionAvailable,
            style: AppTextStyles.poppinsRegular16.copyWith(
              color: const Color(0xff475569),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            context.l10n.location,
            style: AppTextStyles.poppinsBold20,
          ),

          const SizedBox(height: 8),

          if (place.location != null &&
              place.location!.lat != null &&
              place.location!.lng != null)
            const PlaceLocationCard(),

          const SizedBox(height: 24),

          Text(
            context.l10n.reviews,
            style: AppTextStyles.poppinsBold20,
          ),

          const SizedBox(height: 16),

          RatingAndReviewsCard(
            numberOfReviews: place.reviewsCount.toInt(),
            rating: place.rating.toDouble(),
            reviews: place.reviewsSummary ?? {},
          ),

          SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}
