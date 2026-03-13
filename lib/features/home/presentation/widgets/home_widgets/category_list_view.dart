import 'package:flutter/material.dart';
import 'package:guide_me/core/entites/category_entity.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategoryListView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20.p),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(category: categories[index]);
      },
    );
  }
}
