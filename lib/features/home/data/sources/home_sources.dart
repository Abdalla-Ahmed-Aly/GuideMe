import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class HomeService {
  Future<Either<String, Map<String, dynamic>>> getHomeData();
}

@LazySingleton(as: HomeService)
class HomeApiServiceImpl extends HomeService {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either<String, Map<String, dynamic>>> getHomeData() async {
    try {
      _logger.i(
        'HomeApiServiceImpl: Fetching home data from ${ApiConstants.home}',
      );
      var response = await getIt<ApiService>().get(endpoint: ApiConstants.home);
      _logger.d('HomeApiServiceImpl: Successfully fetched home data');
      return Right(response.data as Map<String, dynamic>);
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
}
