import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/core/widgets/dynamic_rating_stars.dart';
import 'package:guide_me/core/shared/cubits/favorites_cubit/favorites_cubit.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key, required this.place});
  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.25 : size.width * 0.25;
    final imageHeight = context.isPortrait
        ? size.height * 0.23
        : size.width * 0.23;

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(AppRoutes.placeDetailsScreen, extra: place);
      },
      child: Container(
        width: width,
        margin: const EdgeInsetsDirectional.only(end: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image and fav button
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  if (place.images.isNotEmpty)
                    Hero(
                      tag: place.id,
                      child: CustomNetworkImage(
                        imageUrl: place.images.first,
                        height: imageHeight,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    ),

                  // favorite button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, state) {
                          final isFav = context
                              .read<FavoritesCubit>()
                              .isFavorite(place.id);
                          return InkWell(
                            onTap: () {
                              context.read<FavoritesCubit>().toggleFavorite(
                                place,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9.5,
                                vertical: 10.5,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Icon(
                                  key: ValueKey(isFav),
                                  isFav
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  color: isFav ? Colors.red : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // place name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                place.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppTextStyles.poppinsSemiBold16,
              ),
            ),

            const SizedBox(height: 3),

            // Rating and reviews
            Row(
              children: [
                const SizedBox(width: 2),
                // Rating
                DynamicRatingStars(rating: place.rating),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '(${place.reviewsCount} ${context.l10n.reviews})',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
              ],
            ),
            const SizedBox(height: 3),
            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '\$${place.price}',
                style: AppTextStyles.poppinsBold16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
