import 'package:guide_me/core/shared/entities/place_entity.dart';

class PlaceByCategoryEntity {
  final String filterApplied;
  final int count;
  final List<PlaceEntity> data;

  PlaceByCategoryEntity({
    required this.filterApplied,
    required this.count,
    required this.data,
  });
}
