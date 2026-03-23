class AddInterestsRequestModel {
  final List<String> interests;

  AddInterestsRequestModel({required this.interests});

  Map<String, dynamic> toJson() {
    return {
      'interests': interests,
    };
  }
}
