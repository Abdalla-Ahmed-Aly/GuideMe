import 'package:guide_me/core/shared/models/category_model.dart';
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/core/shared/models/place_model.dart';

class HomeModel {
  final List<CategoryModel> categories;
  final List<PlaceModel> travelBeyondBoundary;
  final List<CityModel> popularCities;

  HomeModel({
    required this.categories,
    required this.travelBeyondBoundary,
    required this.popularCities,
  });

  factory HomeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null || json['data'] == null) {
      throw Exception('Invalid data format: missing "data" field');
    }
    final data = json['data'];
    return HomeModel(
      categories: data['categories'] != null
          ? List<CategoryModel>.from(
              data['categories'].map((x) => CategoryModel.fromJson(x)),
            )
          : [],
      travelBeyondBoundary: data['travelBeyondBoundary'] != null
          ? List<PlaceModel>.from(
              data['travelBeyondBoundary'].map((x) => PlaceModel.fromJson(x)),
            )
          : [],
      popularCities: data['popularCities'] != null
          ? List<CityModel>.from(
              data['popularCities'].map((x) => CityModel.fromJson(x)),
            )
          : [],
    );
  }
}
