import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.categoryTest,
              fit: BoxFit.cover,
              width: context.isPortrait
                  ? size.height * 0.075
                  : size.width * 0.075,
              height: context.isPortrait
                  ? size.height * 0.075
                  : size.width * 0.075,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Pharaohs',
            style: TextStyle(
              fontSize: 12,
              fontFamily: AppTextStyles.familyPoppins,
            ),
          ),
        ],
      ),
    );
  }
}
