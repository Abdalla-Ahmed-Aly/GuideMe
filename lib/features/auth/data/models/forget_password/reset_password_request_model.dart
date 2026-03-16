class ResetPasswordRequestModel {
  final String email;
  final String forgotPasswordOTP;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordRequestModel({
    required this.email,
    required this.forgotPasswordOTP,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'forgotPasswordOTP': forgotPasswordOTP,
      'newPassword': newPassword,       
      'confirmPassword': confirmPassword, 
    };
  }
}
