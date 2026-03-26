import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/shared/models/city_model.dart';

class CityMapper {
  static CityEntity toEntity(CityModel cityModel) {
    return CityEntity(
      id: cityModel.id ?? "Unkown",
      name: cityModel.name ?? "Unkown",
      image: cityModel.image,
      isPopular: cityModel.isPopular,
    );
  }

  static CityModel toModel(CityEntity entity) {
    return CityModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      isPopular: entity.isPopular,
      updateAt: null,
    );
  }
}
