class CityModel {
  final String id;
  final String name;
  final String image;
  final bool? isPopular;
  final String? updateAt;

  const CityModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isPopular,
    required this.updateAt,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json['_id'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    isPopular: json['isPopular'] != null ? json['isPopular'] as bool : null,
    updateAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
  );
}
