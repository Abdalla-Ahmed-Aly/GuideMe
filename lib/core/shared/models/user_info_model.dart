import 'package:guide_me/core/shared/models/photo_model.dart';

class UserInfoModel {
  final String? id;
  final String? name;
  final String? location;
  final double? lat;
  final double? long;
  final PhotoModel? photo;

  const UserInfoModel({
    required this.id,
    required this.name,
    required this.location,
    required this.lat,
    required this.long,
    required this.photo,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    id: json['_id'] != null ? json['_id'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    location: json['location'] != null ? json['location'] as String : null,
    lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
    long: json['long'] != null ? (json['long'] as num).toDouble() : null,
    photo: json['photo'] != null
        ? PhotoModel.fromJson(json['photo'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'location': location,
      'lat': lat,
      'long': long,
      'photo': photo?.toJson(),
    };
  }
}
