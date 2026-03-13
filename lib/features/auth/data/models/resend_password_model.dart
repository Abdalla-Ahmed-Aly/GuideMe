
class ResendPasswordResponseModel {
  final bool success;
  final String message;

  ResendPasswordResponseModel({required this.success, required this.message});

  factory ResendPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResendPasswordResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}