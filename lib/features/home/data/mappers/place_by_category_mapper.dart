import 'package:guide_me/core/shared/mapper/place_mapper.dart';
import 'package:guide_me/features/home/data/model/place_by_category_model.dart';
import 'package:guide_me/features/home/domain/entity/place_by_category_entity.dart';

class PlaceByCategoryMapper {
  static PlaceByCategoryEntity toEntity(PlaceByCategoryModel model) {
    return PlaceByCategoryEntity(
      filterApplied: model.filterApplied,
      count: model.count,
      data: model.data.map((e) => PlaceMapper.toEntity(e)).toList(),
    );
  }
}
