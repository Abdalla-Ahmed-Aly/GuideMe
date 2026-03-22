import 'package:guide_me/core/shared/entities/city_entity.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class PackageEntity {
  final String packageId;
  final String title;
  final String description;
  final List<PlaceInfoEntity> places;
  final CityEntity city;
  final num totalPrice;
  final num budget;
  final String packagePhoto;
  final String generatedDate;
  final String createdAt;
  final String updatedAt;

  PackageEntity({
    required this.packageId,
    required this.title,
    required this.description,
    required this.places,
    required this.city,
    required this.totalPrice,
    required this.budget,
    required this.packagePhoto,
    required this.generatedDate,
    required this.createdAt,
    required this.updatedAt,
  });
}
