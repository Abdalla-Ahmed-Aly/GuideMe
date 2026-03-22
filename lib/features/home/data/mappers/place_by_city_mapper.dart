import 'package:guide_me/core/shared/mapper/place_mapper.dart';
import 'package:guide_me/features/home/data/model/place_by_cities_model.dart';
import 'package:guide_me/features/home/domain/entity/place_by_cities_entity.dart';

class PlaceByCityMapper {
  static PlaceByCitiesEntity toEntity(PlaceByCitiesModel model) {
    return PlaceByCitiesEntity(
      filterApplied: model.filterApplied,
      count: model.count,
      data: model.data.map((e) => PlaceMapper.toEntity(e)).toList(),
    );
  }
}
