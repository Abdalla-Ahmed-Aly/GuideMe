class VerifyForgetPasswordResponse {
  final bool success;
  final String message;

  VerifyForgetPasswordResponse({
    required this.success,
    required this.message,
  });

  // Factory constructor to create an instance from JSON
  factory VerifyForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return VerifyForgetPasswordResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  // Convert instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}