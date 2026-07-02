import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';

abstract class LocationRemoteDataSource {
  Future<String> getPlaceName(double lat, double lng);
  Future<List<MapLocationEntity>> searchLocation(String query);
}