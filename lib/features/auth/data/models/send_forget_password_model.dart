class SendForgetPasswordResquestModel {
  final bool success;
  final String message;

  SendForgetPasswordResquestModel({
    required this.success,
    required this.message,
  });

  factory SendForgetPasswordResquestModel.fromJson(Map<String, dynamic> json) {
    return SendForgetPasswordResquestModel(
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