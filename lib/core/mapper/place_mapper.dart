import 'package:guide_me/core/entities/place_entity.dart';
import 'package:guide_me/core/mapper/category_mapper.dart';
import 'package:guide_me/core/mapper/city_mapper.dart';
import 'package:guide_me/core/mapper/location_mapper.dart';
import 'package:guide_me/core/models/place_model.dart';

class PlaceMapper {
  static PlaceEntity toEntity(PlaceModel placeModel) {
    return PlaceEntity(
      id: placeModel.id,
      title: placeModel.title,
      description: placeModel.description,
      category: placeModel.category != null
          ? CategoryMapper.toEntity(placeModel.category!)
          : null,
      price: placeModel.price.toDouble(),
      images: placeModel.images,
      location: placeModel.location != null
          ? LocationMapper.toEntity(placeModel.location!)
          : null,
      rating: placeModel.rating.toDouble(),
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
}
