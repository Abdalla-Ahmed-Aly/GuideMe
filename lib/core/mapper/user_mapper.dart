import 'package:guide_me/core/entities/user_entity.dart';
import 'package:guide_me/core/mapper/photo_mapper.dart';
import 'package:guide_me/core/models/user_model.dart';

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