import 'package:guide_me/core/models/places_model.dart';
import 'package:guide_me/features/home/domain/entity/place_by_cities_entity.dart';

class PlaceByCitiesModel extends PlaceByCitiesEntity {
  PlaceByCitiesModel({
    required super.filterApplied,
    required super.count,
    required super.data,
  });

  factory PlaceByCitiesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PlaceByCitiesModel(
        filterApplied: '',
        count: 0,
        data: [],
      );
    }
    return PlaceByCitiesModel(
      filterApplied: json['filterApplied'] ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => PlacesModel.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
    );
  }
}
