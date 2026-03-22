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

  factory PlacesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PlacesModel.empty();
    return PlacesModel(
      id: json["_id"] ?? '',
      title: json["title"] ?? '',
      description: json["description"],
      category: json["category"] is Map<String, dynamic>
          ? CatogryModel.fromJson(
              json["category"] as Map<String, dynamic>,
            )
          : null,
      price: json["price"] ?? 0,
      images: json["images"] != null
          ? List<String>.from(json["images"].map((x) => x))
          : [],
      location: json["location"] != null
          ? LocationModel.fromJson(json["location"])
          : null,
      rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json["reviewsCount"],
      reviewsSummary: json["reviewsSummary"] != null
          ? Map.from(json["reviewsSummary"]).map(
              (k, v) => MapEntry<String, int>(k, v),
            )
          : null,
      city: json["city"] is Map<String, dynamic>
          ? CityModel.fromJson(json["city"] as Map<String, dynamic>)
          : CityModel.empty(),
      minPersons: json["minPersons"],
      maxPersons: json["maxPersons"],
      isPopular: json["isPopular"],
      isBest: json["isBest"],
      isCheap: json["isCheap"],
      durationMinutes: json["durationMinutes"],
    );
  }

  factory PlacesModel.empty() => PlacesModel(
    id: '',
    title: '',
    price: 0,
    images: [],
    rating: 0.0,
    city: CityModel.empty(),
  );
}

class LocationModel extends LocationEntity {
  LocationModel({
    required super.name,
    required super.lat,
    required super.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return LocationModel.empty();
    return LocationModel(
      name: json["name"] ?? '',
      lat: (json["lat"] as num?)?.toDouble() ?? 0.0,
      lng: (json["lng"] as num?)?.toDouble() ?? 0.0,
    );
  }

  factory LocationModel.empty() => LocationModel(
    name: '',
    lat: 0.0,
    lng: 0.0,
  );
}
