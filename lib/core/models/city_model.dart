class CityModel {
  final String id;
  final String name;
  final String image;
  final bool isPopular;
  final String updateAt;

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
    isPopular: json['isPopular'] as bool,
    updateAt: json['updatedAt'] as String,
  );
}
