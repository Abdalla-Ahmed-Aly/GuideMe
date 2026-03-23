import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/shared/models/category_model.dart';
import 'package:guide_me/features/home/data/model/add_interests_request_model.dart';
import 'package:guide_me/features/home/data/model/home_model.dart';
import 'package:guide_me/features/home/data/model/package_model.dart';
import 'package:guide_me/features/home/data/model/place_by_category_model.dart';
import 'package:guide_me/features/home/data/model/place_by_cities_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeService {
  Future<HomeModel> getHomeData();
  Future<PlaceByCategoryModel> getPlacesByCategory({
    required String categoryId,
    required String filter,
  });
  Future<PlaceByCitiesModel> getPlacesByCity({
    required String cityId,
    required String filter,
  });

  Future<List<PackageModel>> getAiPackagesSuggestions();

  Future<List<CategoryModel>> getCatogries();

  Future<List<CategoryModel>> addInterests({
    required AddInterestsRequestModel interests,
  });
}

@LazySingleton(as: HomeService)
class HomeApiServiceImpl extends HomeService {
  final ApiService _apiService;

  HomeApiServiceImpl(this._apiService);

  @override
  Future<HomeModel> getHomeData() async {
    final response = await getIt<ApiService>().get(
      endpoint: ApiConstants.homeEndPoint,
    );

    return HomeModel.fromJson(response.data);
  }

  @override
  Future<PlaceByCategoryModel> getPlacesByCategory({
    required String categoryId,
    required String filter,
  }) async {
    final response = await _apiService.get(
      endpoint: '${ApiConstants.placeByCategory}/$categoryId?filter=$filter',
    );

    return PlaceByCategoryModel.fromJson(response.data);
  }

  @override
  Future<PlaceByCitiesModel> getPlacesByCity({
    required String cityId,
    required String filter,
  }) async {
    final response = await getIt<ApiService>().get(
      endpoint: '${ApiConstants.placeByCity}/$cityId?filter=$filter',
    );

    return PlaceByCitiesModel.fromJson(response.data);
  }

  @override
  Future<List<PackageModel>> getAiPackagesSuggestions() async {
    final response = await getIt<ApiService>().get(
      endpoint: ApiConstants.aiPackages,
    );

    final List<dynamic> data = response.data['data'];
    return data.map((e) => PackageModel.fromJson(e)).toList();
  }

  @override
  Future<List<CategoryModel>> getCatogries() async {
    final response = await _apiService.get(endpoint: ApiConstants.getcatogey);
    final List<dynamic> categoriesJson = response.data['data']['categories'];
    final categories = categoriesJson
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }

  @override
  Future<List<CategoryModel>> addInterests({
    required AddInterestsRequestModel interests,
  }) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.addInterests,
      data: interests.toJson(),
    );
    final List<dynamic> categoriesJson = response.data['data'];
    final categories = categoriesJson
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }
}
