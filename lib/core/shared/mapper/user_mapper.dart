import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/mapper/photo_mapper.dart';
import 'package:guide_me/core/shared/models/user_model.dart';

class UserMapper {
  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
      location: userModel.location,
      lat: userModel.lat,
      long: userModel.long,
      photo: PhotoMapper.toEntity(userModel.photo),
    );
  }
}