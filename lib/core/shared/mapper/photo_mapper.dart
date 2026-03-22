import 'package:guide_me/core/shared/entities/photo_entity.dart';
import 'package:guide_me/core/shared/models/photo_model.dart';

class PhotoMapper {
  static PhotoEntity toEntity(PhotoModel photoModel) {
    return PhotoEntity(
      url: photoModel.url,
      publicId: photoModel.publicId,
    );
  }
}
