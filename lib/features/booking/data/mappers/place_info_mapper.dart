import 'package:guide_me/core/shared/mapper/location_mapper.dart';
import 'package:guide_me/features/booking/data/models/place_info_model.dart';
import 'package:guide_me/features/booking/domain/entities/place_info_entity.dart';

class PlaceInfoMapper {
  static PlaceInfoEntity toEntity(PlaceInfoModel model) {
    return PlaceInfoEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      category: model.category,
      price: model.price,
      images: model.images,
      location: LocationMapper.toEntity(model.location),
      rating: model.rating,
      reviewsCount: model.reviewsCount,
      reviewsSummary: model.reviewsSummary,
      city: model.city,
      minPersons: model.minPersons,
      maxPersons: model.maxPersons,
      isPopular: model.isPopular,
      isBest: model.isBest,
      isCheap: model.isCheap,
      durationMinutes: model.durationMinutes,
    );
  }
}