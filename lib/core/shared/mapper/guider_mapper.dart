import 'package:guide_me/core/shared/entities/guider_entity.dart';
import 'package:guide_me/core/shared/mapper/photo_mapper.dart';
import 'package:guide_me/core/shared/models/guider_model.dart';

class GuiderMapper {
  static GuiderEntity toEntity(GuiderModel guiderModel) {
    return GuiderEntity(
      id: guiderModel.id ?? "Unkown",
      name: guiderModel.name ?? "Unkown",
      photo: guiderModel.photo != null
          ? PhotoMapper.toEntity(guiderModel.photo!)
          : null,
    );
  }
}