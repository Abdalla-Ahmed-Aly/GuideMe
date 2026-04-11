
class UserInforamtionModel {
  final String id;
  final String name;
  final String image;

  UserInforamtionModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory UserInforamtionModel.fromJson(Map<String, dynamic> json) {
    return UserInforamtionModel(
      id: json['_id'],
      name: json['name'],
      image: json['photo']?['secure_url'] ?? '',
    );
  }
}