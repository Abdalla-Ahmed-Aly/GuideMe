import 'package:guide_me/core/models/category_model.dart';
import 'package:guide_me/core/models/city_model.dart';
import 'package:guide_me/core/models/places_model.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required List<CategoryModel> super.categories,
    required PlacesModel super.mostFamousTrip,
    required List<PlacesModel> super.travelBeyondBoundary,
    required List<CityModel> super.popularCities,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return HomeModel(
      categories: List<CategoryModel>.from(
        data['categories'].map((x) => CategoryModel.fromJson(x)),
      ),
      mostFamousTrip: PlacesModel.fromJson(data['mostFamousTrip']),
      travelBeyondBoundary: List<PlacesModel>.from(
        data['travelBeyondBoundary'].map((x) => PlacesModel.fromJson(x)),
      ),
      popularCities: List<CityModel>.from(
        data['popularCities'].map((x) => CityModel.fromJson(x)),
      ),
    );
  }
}
