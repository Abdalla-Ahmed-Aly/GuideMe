import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';

class HomeEntity {
  final List<CategoryEntity> categories;
  final List<PlaceEntity> travelBeyondBoundary;
  final List<CityEntity> popularCities;

  const HomeEntity({
    required this.categories,
    required this.travelBeyondBoundary,
    required this.popularCities,
  });
}
