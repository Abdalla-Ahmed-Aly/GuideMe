import 'package:guide_me/core/shared/mapper/category_mapper.dart';
import 'package:guide_me/core/shared/mapper/city_mapper.dart';
import 'package:guide_me/core/shared/mapper/place_mapper.dart';
import 'package:guide_me/features/home/data/model/home_model.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';

class HomeMapper {
  static HomeEntity toEntity(HomeModel model) {
    return HomeEntity(
      categories: model.categories
          .map((e) => CategoryMapper.toEntity(e))
          .toList(),
      travelBeyondBoundary: model.travelBeyondBoundary
          .map((e) => PlaceMapper.toEntity(e))
          .toList(),
      popularCities: model.popularCities
          .map((e) => CityMapper.toEntity(e))
          .toList(),
    );
  }
}
