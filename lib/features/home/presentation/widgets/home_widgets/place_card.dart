import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({super.key});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(AppRoutes.placeDetailsScreen);
      },
      child: Container(
        width: context.isPortrait ? size.height * 0.25 : size.width * 0.25,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image and fav button
            Container(
              height: context.isPortrait
                  ? size.height * 0.23
                  : size.width * 0.23,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(AppImages.placeTest),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
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
            ),

            const SizedBox(height: 8),

            // place name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'The Grand Egyptian Museum',
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
                  const Icon(
                    Icons.star_rounded,
                    color: AppColors.yellow,
                    size: 16,
                  ),

                const SizedBox(width: 10),
                // reviews
                Text(
                  '(100 reviews)',
                  style: AppTextStyles.poppinsRegular12,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '\$00.00',
                style: AppTextStyles.poppinsSemiBold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
