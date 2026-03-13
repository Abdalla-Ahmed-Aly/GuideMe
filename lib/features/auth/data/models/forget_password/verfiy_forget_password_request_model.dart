class VerifyForgetPasswordRequestModel {
  final String email;
  final String otp;

  VerifyForgetPasswordRequestModel({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}