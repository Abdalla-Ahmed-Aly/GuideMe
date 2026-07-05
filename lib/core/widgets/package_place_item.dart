import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class PackagePlaceItem extends StatelessWidget {
  const PackagePlaceItem({super.key, required this.place});
  final PlaceInfoEntity place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.packagePlaceDetailsScreen, extra: place);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffF3F4F6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: place.id,
                child: CustomNetworkImage(
                  imageUrl: place.images.isNotEmpty ? place.images.first : '',
                  height: context.screenHeight * 0.12,
                  width: context.screenHeight * 0.12,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.interBold16,
                  ),
                  Text(
                    place.location?.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.interRegular14.copyWith(
                      color: const Color(0xff6B7280),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      DynamicRatingStars(rating: place.rating.toDouble()),
                      const SizedBox(width: 4),
                      Text(
                        "(${place.rating})",
                        style: AppTextStyles.interRegular14.copyWith(
                          color: const Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Text.rich(
                    TextSpan(
                      text: "\$${place.price.toDouble()}",
                      style: AppTextStyles.interBold16.copyWith(
                        color: AppColors.primary2,
                      ),
                      children: [
                        TextSpan(
                          text: " /${context.l10n.person}",
                          style: AppTextStyles.interRegular14.copyWith(
                            color: const Color(0xff9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
