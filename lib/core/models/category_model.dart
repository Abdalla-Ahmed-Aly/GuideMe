import 'package:guide_me/core/entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
  );
}
