import 'package:guide_me/features/booking/data/models/guider_models/review_tourist_model.dart';

class ReviewModel {
  final String id;
  final String bookingId;
  final ReviewTouristModel tourist;
  final int rating;
  final String comment;
  final DateTime createdAt;

  const ReviewModel({
    required this.id,
    required this.bookingId,
    required this.tourist,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json['_id'],
    bookingId: json['booking'],
    tourist: ReviewTouristModel.fromJson(json['tourist']),
    rating: json['rating'],
    comment: json['comment'],
    createdAt: DateTime.parse(json['createdAt']),
  );
}
