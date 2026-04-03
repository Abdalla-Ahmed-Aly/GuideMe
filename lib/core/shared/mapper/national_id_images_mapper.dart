import 'package:guide_me/core/shared/entities/national_id_images_entity.dart';
import 'package:guide_me/core/shared/models/national_id_images_model.dart';

class NationalIdImagesMapper {
  static NationalIdImagesEntity toEntity(NationalIdImagesModel model) {
    return NationalIdImagesEntity(
      front: model.front,
      back: model.back,
    );
  }

  static NationalIdImagesModel toModel(NationalIdImagesEntity entity) {
    return NationalIdImagesModel(
      front: entity.front,
      back: entity.back,
    );
  }
}