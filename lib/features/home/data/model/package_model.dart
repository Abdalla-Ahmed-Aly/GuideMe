import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/core/shared/models/place_info_model.dart';

class PackageModel{
  final String packageId;
  final String title;
  final String description;
  final List<PlaceInfoModel> places;
  final CityModel city;
  final num totalPrice;
  final num budget;
  final String packagePhoto;
  final String generatedDate;
  final String createdAt;
  final String updatedAt;

  PackageModel({
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

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      packageId: json['packageId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => PlaceInfoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      city: CityModel.fromJson(json['city']),
      totalPrice: json['totalPrice'] ?? 0,
      budget: json['budget'] ?? 0,
      packagePhoto: json['packagePhoto'] ?? '',
      generatedDate: json['generatedDate'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
