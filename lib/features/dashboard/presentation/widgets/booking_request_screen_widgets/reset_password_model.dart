class ResetPasswordModel {
  final bool success;
  final String message;

  ResetPasswordModel({
    required this.success,
    required this.message,
  });

  // تحويل JSON من السيرفر → Dart object
  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
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