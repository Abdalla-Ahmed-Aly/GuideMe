import 'package:guide_me/core/shared/models/photo_model.dart';

class UserInfoModel {
  final String id;
  final String name;
  final String location;
  final double lat;
  final double long;
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
    id: json['_id'] as String,
    name: json['name'] as String,
    location: json['location'] as String,
    lat: (json['lat'] as num).toDouble(),
    long: (json['long'] as num).toDouble(),
    photo: json['photo'] != null
        ? PhotoModel.fromJson(json['photo'] as Map<String, dynamic>)
        : null,
  );
}
