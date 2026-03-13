
class VerifyForgetPasswordResponse {
  final bool success;
  final String message;

  VerifyForgetPasswordResponse({
    required this.success,
    required this.message,
  });

  factory VerifyForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return VerifyForgetPasswordResponse(
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
    };
  }
}