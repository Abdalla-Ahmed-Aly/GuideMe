import 'package:guide_me/core/shared/entities/user_entity.dart';

class AuthResponseEntity {
  final bool success;
  final String message;
  final String token;
  final UserEntity user;

  AuthResponseEntity({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });
}