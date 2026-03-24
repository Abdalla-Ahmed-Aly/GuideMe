import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/core/shared/mapper/photo_mapper.dart';
import 'package:guide_me/core/shared/models/user_info_model.dart';

class UserInfoMapper {
  static UserInfoEntity toEntity(UserInfoModel userModel) {
    return UserInfoEntity(
      id: userModel.id,
      name: userModel.name,
      location: userModel.location,
      lat: userModel.lat,
      long: userModel.long,
      photo: userModel.photo != null
          ? PhotoMapper.toEntity(userModel.photo!)
          : null,
    );
  }
}
