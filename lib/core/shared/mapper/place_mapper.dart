import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/shared/mapper/category_mapper.dart';
import 'package:guide_me/core/shared/mapper/city_mapper.dart';
import 'package:guide_me/core/shared/mapper/location_mapper.dart';
import 'package:guide_me/core/shared/models/place_model.dart';

class PlaceMapper {
  static PlaceEntity toEntity(PlaceModel placeModel) {
    return PlaceEntity(
      id: placeModel.id ?? "Unkown",
      title: placeModel.title ?? "Unkown",
      description: placeModel.description,
      category: placeModel.category != null
          ? CategoryMapper.toEntity(placeModel.category!)
          : null,
      price: placeModel.price?.toDouble() ?? 0,
      images: placeModel.images ?? [],
      location: placeModel.location != null
          ? LocationMapper.toEntity(placeModel.location!)
          : null,
      rating: placeModel.rating?.toDouble() ?? 0,
      reviewsCount: placeModel.reviewsCount?.toInt() ?? 0,
      reviewsSummary: placeModel.reviewsSummary != null
          ? Map.from(placeModel.reviewsSummary!)
          : null,
      city: placeModel.city != null
          ? CityMapper.toEntity(placeModel.city!)
          : null,
      minPersons: placeModel.minPersons?.toInt() ?? 0,
      maxPersons: placeModel.maxPersons?.toInt() ?? 0,
      isPopular: placeModel.isPopular,
      isBest: placeModel.isBest,
      isCheap: placeModel.isCheap,
      durationMinutes: placeModel.durationMinutes?.toInt() ?? 0,
    );
  }

  static PlaceModel toModel(PlaceEntity entity) {
    return PlaceModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category != null
          ? CategoryMapper.toModel(entity.category!)
          : null,
      price: entity.price,
      images: entity.images,
      location: entity.location != null
          ? LocationMapper.toModel(entity.location!)
          : null,
      rating: entity.rating,
      reviewsCount: entity.reviewsCount,
      reviewsSummary: entity.reviewsSummary != null
          ? Map.from(entity.reviewsSummary!).map((k, v) => MapEntry<String, num>(k, v))
          : null,
      city: entity.city != null ? CityMapper.toModel(entity.city!) : null,
      minPersons: entity.minPersons,
      maxPersons: entity.maxPersons,
      isPopular: entity.isPopular,
      isBest: entity.isBest,
      isCheap: entity.isCheap,
      durationMinutes: entity.durationMinutes,
    );
  }
}
