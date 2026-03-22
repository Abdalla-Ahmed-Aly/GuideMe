import 'package:guide_me/core/shared/entities/place_entity.dart';

class PlaceByCitiesEntity {
  final String filterApplied;
  final int count;
  final List<PlaceEntity> data;

  PlaceByCitiesEntity({
    required this.filterApplied,
    required this.count,
    required this.data,
  });
}
