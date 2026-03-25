import 'package:guide_me/core/shared/models/category_model.dart';
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/core/shared/models/location_model.dart';

class PlaceModel {
  final String? id;
  final String? title;
  final String? description;
  final CategoryModel? category;
  final num? price;
  final List<String>? images;
  final LocationModel? location;
  final num? rating;
  final num? reviewsCount;
  final Map<String, num>? reviewsSummary;
  final CityModel? city;
  final num? minPersons;
  final num? maxPersons;
  final bool? isPopular;
  final bool? isBest;
  final bool? isCheap;
  final num? durationMinutes;

  PlaceModel({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    required this.images,
    this.location,
    required this.rating,
    this.reviewsCount,
    this.reviewsSummary,
    required this.city,
    this.minPersons,
    this.maxPersons,
    this.isPopular,
    this.isBest,
    this.isCheap,
    this.durationMinutes,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    category: json["category"] != null
        ? CategoryModel.fromJson(json["category"])
        : null,
    price: json["price"].toDouble(),
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
