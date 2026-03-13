class SendForgetPasswordRequestModel {
  final String email;

  SendForgetPasswordRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}