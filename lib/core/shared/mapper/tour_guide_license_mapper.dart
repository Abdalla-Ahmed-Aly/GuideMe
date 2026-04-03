import 'package:guide_me/core/shared/entities/tour_guide_license_entity.dart';
import 'package:guide_me/core/shared/models/tour_guide_license_model.dart';

class TourGuideLicenseMapper {
  static TourGuideLicenseEntity toEntity(TourGuideLicenseModel model) {
    return TourGuideLicenseEntity(
      secureUrl: model.secureUrl,
      publicId: model.publicId,
    );
  }

  static TourGuideLicenseModel toModel(TourGuideLicenseEntity entity) {
    return TourGuideLicenseModel(
      secureUrl: entity.secureUrl,
      publicId: entity.publicId,
    );
  }
}