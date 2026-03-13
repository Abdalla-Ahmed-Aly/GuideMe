
class ResendPasswordModel {
  final bool success;
  final String message;

  ResendPasswordModel({required this.success, required this.message});

  factory ResendPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResendPasswordModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}