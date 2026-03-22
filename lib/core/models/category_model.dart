import 'package:guide_me/core/entites/category_entity.dart';

class GetCategoriesResponse extends CategoryEntity {
  GetCategoriesResponse({
    required super.id,
    required super.name,
    required super.image,
    required super.slug,
  });

  factory GetCategoriesResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GetCategoriesResponse.empty();
    return GetCategoriesResponse(
      id: json["_id"] ?? '',
      name: json["name"] ?? '',
      image: json["image"] ?? '',
      slug: json["slug"] ?? '',
    );
  }

  factory GetCategoriesResponse.empty() => GetCategoriesResponse(
    id: '',
    name: '',
    image: '',
    slug: '',
  );
}
