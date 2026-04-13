import 'package:guide_me/core/shared/enums/user_role.dart';

class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String phone;
  final UserRole role;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "role": role.name,
    };
  }
}