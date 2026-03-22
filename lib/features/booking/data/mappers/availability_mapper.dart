import 'package:guide_me/features/booking/data/models/guider_models/availability_model.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/availability_entity.dart';

class AvailabilityMapper {
  static AvailabilityEntity toEntity(AvailabilityModel model) {
    return AvailabilityEntity(
      days: model.days,
      from: model.from,
      to: model.to,
    );
  }
}