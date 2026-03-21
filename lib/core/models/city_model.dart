import 'package:guide_me/core/entites/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    required super.id,
    required super.name,
    super.image,
    super.isPopular,
  });

  factory CityModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CityModel.empty();
    return CityModel(
      id: json["_id"] ?? '',
      name: json["name"] ?? '',
      image: json["image"],
    );
  }

  factory CityModel.empty() => CityModel(
        id: '',
        name: '',
      );
}
