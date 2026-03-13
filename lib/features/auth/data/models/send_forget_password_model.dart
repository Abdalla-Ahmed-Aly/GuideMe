class SendForgetPasswordResponsetModel {
  final bool success;
  final String message;

  SendForgetPasswordResponsetModel({
    required this.success,
    required this.message,
  });

  factory SendForgetPasswordResponsetModel.fromJson(Map<String, dynamic> json) {
    return SendForgetPasswordResponsetModel(
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