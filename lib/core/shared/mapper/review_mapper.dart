import 'package:guide_me/core/shared/models/review_model.dart';
import 'package:guide_me/core/shared/entities/review_entity.dart';

class ReviewMapper {
  static ReviewEntity toEntity(ReviewModel model) {
    return ReviewEntity(
      id: model.id ?? "Unkown",
      touristName: model.tourist?.name ?? "Unkown",
      touristPhoto: model.tourist?.photo?.url,
      rating: model.rating ?? 0,
      comment: model.comment ?? "",
      createdAt: model.createdAt,
    );
  }
}