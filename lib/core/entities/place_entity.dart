import 'package:guide_me/core/entities/category_entity.dart';
import 'package:guide_me/core/entities/city_entity.dart';
import 'package:guide_me/core/entities/location_entity.dart';

class PlaceEntity {
  final String id;
  final String title;
  final String? description;
  final CategoryEntity? category;
  final double price;
  final List<String> images;
  final LocationEntity? location;
  final double rating;
  final int reviewsCount;
  final Map<String, int>? reviewsSummary;
  final CityEntity? city;
  final int? minPersons;
  final int? maxPersons;
  final bool? isPopular;
  final bool? isBest;
  final bool? isCheap;
  final int? durationMinutes;

  const PlaceEntity({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    required this.images,
    this.location,
    required this.rating,
    required this.reviewsCount,
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