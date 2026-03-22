import 'package:guide_me/core/shared/models/place_model.dart';

class PlaceByCategoryModel {
  final String filterApplied;
  final int count;
  final List<PlaceModel> data;

  PlaceByCategoryModel({
    required this.filterApplied,
    required this.count,
    required this.data,
  });

  factory PlaceByCategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PlaceByCategoryModel(
        filterApplied: '',
        count: 0,
        data: [],
      );
    }
    return PlaceByCategoryModel(
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
