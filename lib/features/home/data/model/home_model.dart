import 'package:guide_me/core/models/category_model.dart';
import 'package:guide_me/core/models/city_model.dart';
import 'package:guide_me/core/models/places_model.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required List<GetCategoriesResponse> super.categories,
    required PlacesModel super.mostFamousTrip,
    required List<PlacesModel> super.travelBeyondBoundary,
    required List<CityModel> super.popularCities,
  });

  factory HomeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null || json['data'] == null) {
      throw Exception('Invalid data format: missing "data" field');
    }
    final data = json['data'];
    return HomeModel(
      categories: data['categories'] != null
          ? List<GetCategoriesResponse>.from(
              data['categories'].map((x) => GetCategoriesResponse.fromJson(x)),
            )
          : [],
      mostFamousTrip: data['mostFamousTrip'] != null
          ? PlacesModel.fromJson(data['mostFamousTrip'])
          : PlacesModel.empty(),
      travelBeyondBoundary: data['travelBeyondBoundary'] != null
          ? List<PlacesModel>.from(
              data['travelBeyondBoundary'].map((x) => PlacesModel.fromJson(x)),
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
