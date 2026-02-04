import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PlaceListTile extends StatelessWidget {
  const PlaceListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(AppRoutes.placeDetailsScreen);
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
              Image.asset(
                AppImages.placeTest,
                width: context.isPortrait
                    ? size.width * 0.31
                    : size.height * 0.3,
                height: context.isPortrait
                    ? size.height * 0.173
                    : size.width * 0.173,
                fit: BoxFit.cover,
              ),

              const SizedBox(width: 8),

              // Data
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),

                    // Title
                    Text(
                      "The Grand Egyptian Museum The Grand Egyptian Museum The Grand Egyptian Museum",
                      style: AppTextStyles.interSemiBold14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Location
                    Text(
                      "Location: Cairo - Alexandria Desert Rd, Kafr Nassar, Al Haram, Giza Governorate Location: Cairo - Alexandria Desert Rd, Kafr Nassar, Al Haram, Giza Governorate",
                      style: AppTextStyles.interRegular8,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 6),

                    // Description
                    Text(
                      "The Grand Egyptian Museum is a modern museum that houses the largest collection of ancient Egyptian artifacts in the world. The museum opened in 2019 and is located in Giza, Egypt. The museum is home to over 10,000 artifacts, including the famous Rosetta Stone and the Great Pyramid of Giza.",
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
                        for (int i = 0; i < 7; i++)
                          Icon(
                            Icons.star_rounded,
                            color: AppColors.primary,
                            size: 16.ic,
                          ),

                        const Spacer(),

                        // Price
                        Column(
                          children: [
                            Text(
                              "\$50",
                              style: AppTextStyles.interSemiBold14,
                            ),
                            Text(
                              "package",
                              style: TextStyle(
                                fontSize: 10.fs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),
                  ],
                ),
              ),

              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
