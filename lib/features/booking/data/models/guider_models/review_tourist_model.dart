import 'package:guide_me/core/models/photo_model.dart';

class ReviewTouristModel {
  final String id;
  final String name;
  final PhotoModel photo;

  const ReviewTouristModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory ReviewTouristModel.fromJson(Map<String, dynamic> json) =>
      ReviewTouristModel(
        id: json['_id'],
        name: json['name'],
        photo: PhotoModel.fromJson(json['photo']),
      );
}
