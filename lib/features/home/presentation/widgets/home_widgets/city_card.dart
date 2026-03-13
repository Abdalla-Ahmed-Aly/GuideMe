import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/entites/city_entity.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CityCard extends StatelessWidget {
  final CityEntity city;
  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(AppRoutes.explorePlacesScreen, extra: city.name);
      },
      child: Container(
        width: context.isPortrait ? size.height * 0.23 : size.width * 0.23,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: city.image != null
                ? NetworkImage(city.image!)
                : const AssetImage(AppImages.cityTest) as ImageProvider,
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: AlignmentGeometry.bottomLeft,
          child: Text(
            city.name,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.poppinsSemiBold14.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
