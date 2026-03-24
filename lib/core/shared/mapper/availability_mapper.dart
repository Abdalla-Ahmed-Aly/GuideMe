import 'package:guide_me/core/shared/models/availability_model.dart';
import 'package:guide_me/core/shared/entities/availability_entity.dart';

class AvailabilityMapper {
  static AvailabilityEntity toEntity(AvailabilityModel model) {
    return AvailabilityEntity(
      days: model.days,
      from: model.from,
      to: model.to,
    );
  }
}