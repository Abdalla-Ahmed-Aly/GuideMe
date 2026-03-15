import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/home/data/model/home_model.dart';
import 'package:guide_me/features/home/data/model/place_by_category_model.dart';
import 'package:guide_me/features/home/data/model/place_by_cities_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class HomeService {
  Future<Either> getHomeData();
  Future<Either> getPlacesByCategory({
    required String categoryId,
    required String filter,
  });
  Future<Either<String, PlaceByCitiesModel>> getPlacesByCity({
    required String cityId,
    required String filter,
  });
}

@LazySingleton(as: HomeService)
class HomeApiServiceImpl extends HomeService {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either> getHomeData() async {
    try {
      _logger.i(
        'HomeApiServiceImpl: Fetching home data from ${ApiConstants.homeEndPoint}',
      );
      var response = await getIt<ApiService>().get(
        endpoint: ApiConstants.homeEndPoint,
      );
      _logger.d('HomeApiServiceImpl: Successfully fetched home data');

      if (response.data == null) {
        _logger.e('HomeApiServiceImpl: API response data is null');
        return Left('Server error: received empty data');
      }

      return Right(HomeModel.fromJson(response.data));
    } on DioException catch (e) {
      _logger.e('HomeApiServiceImpl: DioException: ${e.message}');
      return Left(
        e.response?.data?['message'] ?? e.message ?? 'Server error occurred',
      );
    } catch (e) {
      _logger.e('HomeApiServiceImpl: Unknown Error: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PlaceByCategoryModel>> getPlacesByCategory({
    required String categoryId,
    required String filter,
  }) async {
    try {
      _logger.i(
        'HomeApiServiceImpl: Fetching places for category $categoryId from ${ApiConstants.place_by_category}/$categoryId?filter=$filter',
      );
      final response = await getIt<ApiService>().get(
        endpoint:
            '${ApiConstants.place_by_category}/$categoryId?filter=$filter',
      );
      _logger.d(
        'HomeApiServiceImpl: Successfully fetched places for category $categoryId',
      );

      if (response.data == null) {
        _logger.e(
          'HomeApiServiceImpl: API response data for category $categoryId is null',
        );
        return Left('Server error: received empty data');
      }

      return Right(PlaceByCategoryModel.fromJson(response.data));
    } on DioException catch (e) {
      _logger.e(
        'HomeApiServiceImpl: DioException on getPlacesByCategory: ${e.message}',
      );
      return Left(
        e.response?.data?['message'] ?? e.message ?? 'Server error occurred',
      );
    } catch (e) {
      _logger.e('HomeApiServiceImpl: Unknown Error on getPlacesByCategory: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PlaceByCitiesModel>> getPlacesByCity({
    required String cityId,
    required String filter,
  }) async {
    try {
      _logger.i(
        'HomeApiServiceImpl: Fetching places for city $cityId from ${ApiConstants.place_by_city}/$cityId?filter=$filter',
      );
      final response = await getIt<ApiService>().get(
        endpoint: '${ApiConstants.place_by_city}/$cityId?filter=$filter',
      );
      _logger.d(
        'HomeApiServiceImpl: Successfully fetched places for city $cityId',
      );

      if (response.data == null) {
        _logger.e(
          'HomeApiServiceImpl: API response data for city $cityId is null',
        );
        return Left('Server error: received empty data');
      }

      return Right(PlaceByCitiesModel.fromJson(response.data));
    } on DioException catch (e) {
      _logger.e(
        'HomeApiServiceImpl: DioException on getPlacesByCity: ${e.message}',
      );
      return Left(
        e.response?.data?['message'] ?? e.message ?? 'Server error occurred',
      );
    } catch (e) {
      _logger.e('HomeApiServiceImpl: Unknown Error on getPlacesByCity: $e');
      return Left(e.toString());
    }
  }
}
