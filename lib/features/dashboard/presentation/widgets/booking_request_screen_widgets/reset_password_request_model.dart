class ResetPasswordRequestModel {
  final String email;       
  final String newPassword; 
  final String otp;         

  ResetPasswordRequestModel({
    required this.email,
    required this.newPassword,
    required this.otp,
  });

  // تحويل Dart object → JSON عشان نبعته للسيرفر
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'new_password': newPassword,
      'otp': otp,
    };
  }
}