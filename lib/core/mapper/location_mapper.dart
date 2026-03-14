import 'package:guide_me/core/entities/location_entity.dart';
import 'package:guide_me/core/models/location_model.dart';

class LocationMapper {
  static LocationEntity toEntity(LocationModel locationModel) {
    return LocationEntity(
      name: locationModel.name,
      lat: locationModel.lat,
      lng: locationModel.lng,
    );
  }
}