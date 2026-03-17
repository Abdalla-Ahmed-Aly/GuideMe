import 'package:guide_me/core/models/location_model.dart';

class PlaceInfoModel {
  final String id;
  final String title;
  final String? description;
  final String category;
  final num price;
  final List<String> images;
  final LocationModel location;
  final num rating;
  final num? reviewsCount;
  final Map<String, num>? reviewsSummary;
  final String city;
  final num? minPersons;
  final num? maxPersons;
  final bool? isPopular;
  final bool? isBest;
  final bool? isCheap;
  final num? durationMinutes;

  PlaceInfoModel({
    required this.id,
    required this.title,
    this.description,
    required this.category,
    required this.price,
    required this.images,
    required this.location,
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

  factory PlaceInfoModel.fromJson(Map<String, dynamic> json) => PlaceInfoModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    category: json["category"],
    price: json["price"].toDouble(),
    images: List<String>.from(json["images"].map((x) => x)),
    location: LocationModel.fromJson(json["location"]),
    rating: json["rating"]?.toDouble(),
    reviewsCount: json["reviewsCount"],
    reviewsSummary: json["reviewsSummary"] != null
        ? Map.from(json["reviewsSummary"]).map(
            (k, v) => MapEntry<String, int>(k, v),
          )
        : null,
    city: json["city"],
    minPersons: json["minPersons"],
    maxPersons: json["maxPersons"],
    isPopular: json["isPopular"],
    isBest: json["isBest"],
    isCheap: json["isCheap"],
    durationMinutes: json["durationMinutes"],
  );
}
