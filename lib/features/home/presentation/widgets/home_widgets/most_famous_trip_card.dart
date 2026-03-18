import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_shimmer.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class MostFamousTripCard extends StatefulWidget {
  final PackageEntity package;
  const MostFamousTripCard({super.key, required this.package});

  @override
  State<MostFamousTripCard> createState() => _MostFamousTripCardState();
}

class _MostFamousTripCardState extends State<MostFamousTripCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width * 0.87;
    final height = context.isPortrait ? size.height * 0.41 : size.width * 0.41;

    return GestureDetector(
      onTap: () {
        if (widget.package.places.isNotEmpty) {
          context.push(
            AppRoutes.placeDetailsScreen,
            extra: widget.package.places.first,
          );
        }
      },
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              // Background Image with Shimmer loading
              if (widget.package.packagePhoto.isNotEmpty)
                Image.network(
                  widget.package.packagePhoto,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CustomShimmer(
                      width: width,
                      height: height,
                      borderRadius: 25,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: width,
                    height: height,
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  ),
                )
              else
                Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                ),

              // UI Content Layer
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Favorite Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.5,
                            horizontal: 9.5,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 24,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 55.h),

                  // Main Texts
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: context.isLandscape
                          ? size.width * 0.1
                          : size.height * 0.1,
                    ),
                    child: Text(
                      widget.package.title,
                      style: AppTextStyles.poppinsBold30.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Sub Texts
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.package.city.name,
                      style: AppTextStyles.poppinsMedium16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Price Button
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 44.m,
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xffA2A7AA).withValues(alpha: .48),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Arrow
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xff72716F,
                            ).withValues(alpha: .38),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),

                        // Price Text
                        Text(
                          "${widget.package.totalPrice}${context.l10n.egp}",
                          style: AppTextStyles.poppinsBold20.copyWith(
                            color: AppColors.white,
                          ),
                        ),

                        // Spacing for centering
                        const SizedBox(width: 45),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
