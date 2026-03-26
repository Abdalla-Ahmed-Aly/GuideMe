import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';

class PlaceListTile extends StatelessWidget {
  const PlaceListTile({super.key, required this.place});
  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final imageWidth = context.isPortrait
        ? size.width * 0.31
        : size.height * 0.3;
    final imageHeight = context.isPortrait
        ? size.height * 0.173
        : size.width * 0.173;

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(AppRoutes.placeDetailsScreen, extra: place);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Image
              if (place.images.isNotEmpty)
                Hero(
                  tag: place.id,
                  child: CustomNetworkImage(
                    imageUrl: place.images.first,
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(width: 8),

              // Data
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: context.isArabic ? 0 : 8,
                    left: context.isEnglish ? 0 : 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),

                      // Title
                      Text(
                        place.title,
                        style: AppTextStyles.interSemiBold14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // Location
                      Text(
                        "${context.l10n.location}: ${place.city?.name}",
                        style: AppTextStyles.interRegular8,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 6),

                      // Description
                      Text(
                        place.description!,
                        style: AppTextStyles.interRegular8.copyWith(
                          color: AppColors.natural4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      // Rate & Price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Rate
                          DynamicRatingStars(rating: place.rating),

                          const Spacer(),

                          // Price
                          Column(
                            children: [
                              Text(
                                "${place.price} ${context.l10n.egp}",
                                style: AppTextStyles.interSemiBold14.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                context.l10n.package,
                                style: AppTextStyles.interMedium12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
