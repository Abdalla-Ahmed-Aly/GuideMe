import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategoryListView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        left: context.isArabic ? 0 : 20.p,
        right: context.isArabic ? 20.p : 0,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(category: categories[index]);
      },
    );
  }
}
