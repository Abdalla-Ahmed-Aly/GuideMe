import 'package:guide_me/core/shared/entities/review_entity.dart';

class AnalysisEntity {
  final int totalEarnings;
  final int completedTours;
  final double averageRating;
  final int totalReviews;
  final Map<String, dynamic> ratingDistribution;
  final List<ReviewEntity> reviews;

  AnalysisEntity({
    required this.totalEarnings,
    required this.completedTours,
    required this.averageRating,
    required this.totalReviews,
    required this.ratingDistribution,
    required this.reviews,
  });
}