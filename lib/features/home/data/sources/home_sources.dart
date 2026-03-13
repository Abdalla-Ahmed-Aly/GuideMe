import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/home/data/model/home_model.dart';
import 'package:guide_me/features/home/data/model/place_by_category_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class HomeService {
  Future<Either> getHomeData();
  Future<Either> getPlacesByCategory({
    required String categoryId,
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
        'HomeApiServiceImpl: Fetching home data from ${ApiConstants.home}',
      );
      var response = await getIt<ApiService>().get(endpoint: ApiConstants.home);
      _logger.d('HomeApiServiceImpl: Successfully fetched home data');
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
  }) async {
    try {
      _logger.i(
        'HomeApiServiceImpl: Fetching places for category $categoryId from ${ApiConstants.home}/$categoryId',
      );
      final response = await getIt<ApiService>().get(
        endpoint: '${ApiConstants.home}/$categoryId',
      );
      _logger.d(
        'HomeApiServiceImpl: Successfully fetched places for category $categoryId',
      );
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
}
