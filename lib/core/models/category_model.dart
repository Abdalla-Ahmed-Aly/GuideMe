import 'package:guide_me/core/entites/category_entity.dart';

class CatogryModel extends CategoryEntity {
  CatogryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.slug,
  });

  factory CatogryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CatogryModel.empty();
    return CatogryModel(
      id: json["_id"] ?? '',
      name: json["name"] ?? '',
      image: json["image"] ?? '',
      slug: json["slug"] ?? '',
    );
  }

  factory CatogryModel.empty() => CatogryModel(
    id: '',
    name: '',
    image: '',
    slug: '',
  );
}
