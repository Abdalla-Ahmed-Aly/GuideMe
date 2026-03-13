import 'package:guide_me/core/entites/category_entity.dart';
import 'package:guide_me/core/entites/city_entity.dart';
import 'package:guide_me/core/entites/place_entity.dart';

class HomeEntity {
  final List<CategoryEntity> categories;
  final PlaceEntity mostFamousTrip;
  final List<PlaceEntity> travelBeyondBoundary;
  final List<CityEntity> popularCities;

  const HomeEntity({
    required this.categories,
    required this.mostFamousTrip,
    required this.travelBeyondBoundary,
    required this.popularCities,
  });
}
