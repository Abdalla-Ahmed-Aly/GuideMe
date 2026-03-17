import 'package:guide_me/core/entities/location_entity.dart';

class PlaceInfoEntity {
  final String id;
  final String title;
  final String? description;
  final String category;
  final num price;
  final List<String> images;
  final LocationEntity location;
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

  PlaceInfoEntity({
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
}
