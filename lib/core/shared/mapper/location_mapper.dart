import 'package:guide_me/core/shared/entities/location_entity.dart';
import 'package:guide_me/core/shared/models/location_model.dart';

class LocationMapper {
  static LocationEntity toEntity(LocationModel locationModel) {
    return LocationEntity(
      name: locationModel.name,
      lat: locationModel.lat,
      lng: locationModel.lng,
    );
  }
}