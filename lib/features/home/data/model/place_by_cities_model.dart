import 'package:guide_me/core/shared/models/place_model.dart';

class PlaceByCitiesModel {
  final String filterApplied;
  final int count;
  final List<PlaceModel> data;

  PlaceByCitiesModel({
    required this.filterApplied,
    required this.count,
    required this.data,
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
              ?.map((e) => PlaceModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
