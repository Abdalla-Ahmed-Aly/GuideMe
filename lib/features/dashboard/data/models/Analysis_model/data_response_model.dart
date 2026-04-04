import 'package:guide_me/features/dashboard/data/models/Analysis_model/rating_distribution__response_model.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/review_response_model.dart';

class Data {
  int totalEarnings;
  int completedTours;
  double averageRating;
  int totalReviews;
  RatingDistribution ratingDistribution;
  List<Review> reviews;

  Data({
    required this.totalEarnings,
    required this.completedTours,
    required this.averageRating,
    required this.totalReviews,
    required this.ratingDistribution,
    required this.reviews,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalEarnings: json['totalEarnings'],
      completedTours: json['completedTours'],
      averageRating: (json['averageRating'] as num).toDouble(),
      totalReviews: json['totalReviews'],
      ratingDistribution: RatingDistribution.fromJson(json['ratingDistribution']),
      reviews: (json['reviews'] as List)
          .map((item) => Review.fromJson(item))
          .toList(),
    );
  }
}