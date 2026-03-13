class ResendPasswordRequestModel {
  final String email;

  ResendPasswordRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}