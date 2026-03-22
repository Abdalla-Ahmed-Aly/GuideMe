
class GetCategoriesResponse {
  final String id;
  final String name;
  final String image;
  final String slug;

  GetCategoriesResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return GetCategoriesResponse(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      slug: json['slug'],
    );
  }
}