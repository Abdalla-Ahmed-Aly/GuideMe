class ResetPasswordResponseModel {
  final bool success;
  final String message;

  ResetPasswordResponseModel({
    required this.success,
    required this.message,
  });

  // تحويل JSON من السيرفر → Dart object
  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
