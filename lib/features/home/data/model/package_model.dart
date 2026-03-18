import 'package:guide_me/core/models/city_model.dart';
import 'package:guide_me/core/models/places_model.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class PackageModel extends PackageEntity {
  PackageModel({
    required super.packageId,
    required super.title,
    required super.description,
    required super.places,
    required super.city,
    required super.totalPrice,
    required super.budget,
    required super.packagePhoto,
    required super.generatedDate,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      packageId: json['packageId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => PlacesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>?),
      totalPrice: json['totalPrice'] ?? 0,
      budget: json['budget'] ?? 0,
      packagePhoto: json['packagePhoto'] ?? '',
      generatedDate: json['generatedDate'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
