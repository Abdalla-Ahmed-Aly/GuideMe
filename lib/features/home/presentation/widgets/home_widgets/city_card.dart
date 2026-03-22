import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'package:guide_me/core/widgets/custom_shimmer.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city});
  final CityEntity city;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.23 : size.width * 0.23;

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(
          "${AppRoutes.explorePlacesByCityScreen}/${city.id}",
          extra: city.name,
        );
      },
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Image
              Image.network(
                city.image,
                width: width,
                height: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CustomShimmer(
                    width: width,
                    height: double.infinity,
                    borderRadius: 12,
                  );
                },
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  AppImages.cityTest,
                  width: width,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Gradient overlay for better text visibility
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),

              // City Name
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    city.name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppinsSemiBold14.copyWith(
                      color: AppColors.white,
                    ),
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
