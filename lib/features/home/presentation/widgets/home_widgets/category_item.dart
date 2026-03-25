import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.075 : size.width * 0.075;

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.push(
          "${AppRoutes.explorePlacesScreen}/${category.id}",
          extra: category.name,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CustomNetworkImage(
                imageUrl: category.image ?? "",
                fit: BoxFit.cover,
                width: width,
                height: width,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: context.isPortrait
                  ? size.height * 0.08
                  : size.width * 0.08,
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: AppTextStyles.familyPoppins,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
