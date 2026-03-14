import 'package:guide_me/core/entities/city_entity.dart';
import 'package:guide_me/core/models/city_model.dart';

class CityMapper {
  static CityEntity toEntity(CityModel cityModel) {
    return CityEntity(
      id: cityModel.id,
      name: cityModel.name,
      image: cityModel.image,
      isPopular: cityModel.isPopular,
    );
  }
}
