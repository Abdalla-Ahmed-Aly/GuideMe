class NationalityResponseModel {
  final String id;
  final String name;
  final String nationality;

  NationalityResponseModel({
    required this.id,
    required this.name,
    required this.nationality,
  });

  factory NationalityResponseModel.fromJson(Map<String, dynamic> json) {
    return NationalityResponseModel(
      id: json['_id'] ?? json['id'] ?? "",
      name: json['name'] ?? "",
      nationality: json['nationality'] ?? "",
    );
  }
}
