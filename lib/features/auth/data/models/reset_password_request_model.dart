class ResetPasswordRequestModel {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final String otp;

  ResetPasswordRequestModel({
    required this.email,
    required this.newPassword,
    required this.confirmPassword,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
      'otp': otp,
    };
  }
}