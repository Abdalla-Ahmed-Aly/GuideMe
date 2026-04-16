import 'package:guide_me/core/shared/models/review_model.dart';

class AnalysisModel {
  int totalEarnings;
  int completedTours;
  double averageRating;
  int totalReviews;
  Map<String, dynamic> ratingDistribution;
  List<ReviewModel> reviews;

  AnalysisModel({
    required this.totalEarnings,
    required this.completedTours,
    required this.averageRating,
    required this.totalReviews,
    required this.ratingDistribution,
    required this.reviews,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      totalEarnings: json['totalEarnings'],
      completedTours: json['completedTours'],
      averageRating: (json['averageRating'] as num).toDouble(),
      totalReviews: json['totalReviews'],
      ratingDistribution: json['ratingDistribution'],
      reviews: (json['reviews'] as List)
          .map((item) => ReviewModel.fromJson(item))
          .toList(),
    );
  }
}
