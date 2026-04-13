class ToggleStatusModel {
  final bool isOnline;

  ToggleStatusModel({required this.isOnline});

  factory ToggleStatusModel.fromJson(Map<String, dynamic> json) {
    return ToggleStatusModel(
      isOnline: json['data']['isOnline'],
    );
  }
}