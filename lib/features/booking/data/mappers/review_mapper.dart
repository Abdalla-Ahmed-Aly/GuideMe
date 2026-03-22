import 'package:guide_me/features/booking/data/models/guider_models/review_model.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/review_entity.dart';

class ReviewMapper {
  static ReviewEntity toEntity(ReviewModel model) {
    return ReviewEntity(
      id: model.id,
      touristName: model.tourist.name,
      touristPhoto: model.tourist.photo.url,
      rating: model.rating,
      comment: model.comment,
      createdAt: model.createdAt,
    );
  }
}