import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/models/category_model.dart';
import 'package:guide_me/core/models/city_model.dart';

class PlacesModel extends PlaceEntity {
  PlacesModel({
    required super.id,
    required super.title,
    super.description,
    super.category,
    required super.price,
    required super.images,
    super.location,
    required super.rating,
    super.reviewsCount,
    super.reviewsSummary,
    required super.city,
    super.minPersons,
    super.maxPersons,
    super.isPopular,
    super.isBest,
    super.isCheap,
    super.durationMinutes,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    category: json["category"] != null
        ? CategoryModel.fromJson(json["category"])
        : null,
    price: json["price"],
    images: List<String>.from(json["images"].map((x) => x)),
    location: json["location"] != null
        ? LocationModel.fromJson(json["location"])
        : null,
    rating: json["rating"]?.toDouble(),
    reviewsCount: json["reviewsCount"],
    reviewsSummary: json["reviewsSummary"] != null
        ? Map.from(json["reviewsSummary"]).map(
            (k, v) => MapEntry<String, int>(k, v),
          )
        : null,
    city: CityModel.fromJson(json["city"]),
    minPersons: json["minPersons"],
    maxPersons: json["maxPersons"],
    isPopular: json["isPopular"],
    isBest: json["isBest"],
    isCheap: json["isCheap"],
    durationMinutes: json["durationMinutes"],
  );
}

class LocationModel extends LocationEntity {
  LocationModel({
    required super.name,
    required super.lat,
    required super.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["name"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );
}
