class VerifyForgetPasswordRequestModel {
  final String email;
  final String forgotPasswordOTP;

  VerifyForgetPasswordRequestModel({
    required this.email,
    required this.forgotPasswordOTP,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'forgotPasswordOTP': forgotPasswordOTP,
    };
  }
}