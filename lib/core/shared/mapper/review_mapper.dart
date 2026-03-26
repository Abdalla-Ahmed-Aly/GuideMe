import 'package:guide_me/core/shared/models/photo_model.dart';
import 'package:guide_me/core/shared/models/review_model.dart';
import 'package:guide_me/core/shared/entities/review_entity.dart';
import 'package:guide_me/core/shared/models/review_tourist_model.dart';

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

  static ReviewModel toModel(ReviewEntity entity) {
    return ReviewModel(
      id: entity.id,
      tourist: ReviewTouristModel(
        id: null,
        name: entity.touristName,
        photo: entity.touristPhoto != null
            ? PhotoModel(url: entity.touristPhoto!, publicId: null)
            : null,
      ),
      rating: entity.rating,
      comment: entity.comment,
      createdAt: entity.createdAt,
      bookingId: null,
    );
  }
}
