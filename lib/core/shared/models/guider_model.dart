import 'package:guide_me/core/shared/models/photo_model.dart';

class GuiderModel {
  final String id;
  final String name;
  final PhotoModel photo;

  const GuiderModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory GuiderModel.fromJson(Map<String, dynamic> json) => GuiderModel(
    id: json['_id'] as String,
    name: json['name'] as String,
    photo: PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
  );
}
