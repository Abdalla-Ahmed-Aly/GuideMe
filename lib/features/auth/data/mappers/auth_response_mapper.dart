import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:guide_me/features/auth/data/models/auth_response_model.dart';
import 'package:guide_me/features/auth/domain/entities/auth_response_entity.dart';

class AuthResponseMapper {
  static AuthResponseEntity toEntity(AuthResponseModel model) {
    return AuthResponseEntity(
      success: model.success,
      message: model.message,
      token: model.token,
      user: UserMapper.toEntity(model.data),
    );
  }
}