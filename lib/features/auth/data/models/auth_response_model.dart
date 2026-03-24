import 'package:guide_me/core/shared/models/user_model.dart';

class AuthResponseModel {
  final bool success;
  final String message;
  final String token;
  final UserModel data;

  AuthResponseModel({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      data: UserModel.fromJson(json['data']['user']),
    );
  }
}
