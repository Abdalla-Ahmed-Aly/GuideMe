import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({super.key, required this.place});
  final PlaceEntity place;

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;
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
        context.push(AppRoutes.placeDetailsScreen, extra: widget.place);
      },
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 16),
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
                  if (widget.place.images.isNotEmpty)
                    Hero(
                      tag: widget.place.id,
                      child: CustomNetworkImage(
                        imageUrl: widget.place.images.first,
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
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
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
                          child: isFavorite
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.black,
                                ),
                        ),
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
                widget.place.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppTextStyles.poppinsSemiBold16,
              ),
            ),

            const SizedBox(height: 3),

            // Rating and reviews
            Row(
              children: [
                const SizedBox(width: 6),
                // Rating
                for (int i = 0; i < 5; i++)
                  Icon(
                    Icons.star_rounded,
                    color: i < widget.place.rating.floor()
                        ? Colors.amber
                        : Colors.grey,
                    size: 16,
                  ),
                const SizedBox(width: 4),
                Text(
                  widget.place.rating.toString(),
                  style: AppTextStyles.poppinsMedium12.copyWith(
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '${widget.place.price}\$',
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
