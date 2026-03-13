class ResetPasswordResponse {
  final bool success;
  final String message;

  ResetPasswordResponse({
    required this.success,
    required this.message,
  });

  // تحويل JSON من السيرفر → Dart object
  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  // تحويل Dart object → JSON (مش دايمًا محتاج)
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}