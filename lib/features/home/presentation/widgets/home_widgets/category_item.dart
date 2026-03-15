import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/entites/category_entity.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
              child: Image.network(
                category.image,
                fit: BoxFit.cover,
                width: context.isPortrait
                    ? size.height * 0.075
                    : size.width * 0.075,
                height: context.isPortrait
                    ? size.height * 0.075
                    : size.width * 0.075,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: context.isPortrait
                      ? size.height * 0.075
                      : size.width * 0.075,
                  height: context.isPortrait
                      ? size.height * 0.075
                      : size.width * 0.075,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
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
