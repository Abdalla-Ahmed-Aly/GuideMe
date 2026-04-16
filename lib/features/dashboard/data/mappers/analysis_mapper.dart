import 'package:guide_me/core/shared/mapper/review_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/analysis_model.dart';
import 'package:guide_me/features/dashboard/domain/entities/analysis_entity.dart';

class AnalysisMapper {
  static AnalysisEntity toEntity(AnalysisModel data) {
    return AnalysisEntity(
      totalEarnings: data.totalEarnings,
      completedTours: data.completedTours,
      averageRating: data.averageRating,
      totalReviews: data.totalReviews,
      ratingDistribution: data.ratingDistribution,
      reviews: data.reviews.map((e) => ReviewMapper.toEntity(e)).toList(),
    );
  }
}
