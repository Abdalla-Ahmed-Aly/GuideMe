import 'package:guide_me/core/shared/mapper/location_mapper.dart';
import 'package:guide_me/core/shared/models/place_info_model.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class PlaceInfoMapper {
  static PlaceInfoEntity toEntity(PlaceInfoModel model) {
    return PlaceInfoEntity(
      id: model.id?? "Unkown",
      title: model.title ?? "Unkown",
      description: model.description,
      category: model.category ?? "",
      price: model.price ?? 0,
      images: model.images ?? [],
      location: model.location != null ? LocationMapper.toEntity(model.location!) : null,
      rating: model.rating ?? 0,
      reviewsCount: model.reviewsCount ?? 0,
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