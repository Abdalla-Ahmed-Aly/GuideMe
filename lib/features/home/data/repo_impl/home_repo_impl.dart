import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/mapper/mapper.dart';
import 'package:guide_me/features/home/data/model/get_catogry_copy.dart';
import 'package:guide_me/features/home/data/sources/home_sources.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeService homeService;

  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  HomeRepoImpl(this.homeService);

  @override
  Future<Either> getHomeData() async {
    try {
      _logger.i('HomeRepoImpl: Requesting home data from service');
      var returnedData = await getIt<HomeService>().getHomeData();

      return returnedData.fold(
        (error) {
          _logger.e('HomeRepoImpl: Service error: $error');
          return Left(
            AppFailure(failureCode: FailureCode.server, message: error),
          );
        },
        (data) {
          try {
            _logger.d('HomeRepoImpl: Mapping HomeModel to HomeEntity');
            final homeEntity = Mapper.mapHomeModelToHomeEntity(data);
            _logger.i('HomeRepoImpl: Successfully mapped HomeEntity');
            return Right(homeEntity);
          } catch (e) {
            _logger.e('HomeRepoImpl: Mapping error: $e');
            return Left(
              AppFailure(
                failureCode: FailureCode.unknown,
                message: e.toString(),
              ),
            );
          }
        },
      );
    } catch (e) {
      _logger.e('HomeRepoImpl: Unexpected error: $e');
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either> getPlacesByCategory({
    required String categoryId,
    required String filter,
  }) async {
    try {
      _logger.i('HomeRepoImpl: Requesting places for category $categoryId');
      var returnedData = await getIt<HomeService>().getPlacesByCategory(
        categoryId: categoryId,
        filter: filter,
      );

      return returnedData.fold(
        (error) {
          _logger.e('HomeRepoImpl: Service error: $error');
          return Left(
            AppFailure(failureCode: FailureCode.server, message: error),
          );
        },
        (data) {
          try {
            _logger.d(
              'HomeRepoImpl: Mapping PlaceByCategoryModel to PlaceByCategoryEntity',
            );
            final placeByCategoryEntity =
                Mapper.mapPlaceByCategoryModelToEntity(data);
            _logger.i(
              'HomeRepoImpl: Successfully mapped PlaceByCategoryEntity',
            );
            return Right(placeByCategoryEntity);
          } catch (e) {
            _logger.e('HomeRepoImpl: Mapping error: $e');
            return Left(
              AppFailure(
                failureCode: FailureCode.unknown,
                message: e.toString(),
              ),
            );
          }
        },
      );
    } catch (e) {
      _logger.e('HomeRepoImpl: Unexpected error: $e');
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either> getPlacesByCity({
    required String cityId,
    required String filter,
  }) async {
    try {
      _logger.i('HomeRepoImpl: Requesting places for city $cityId');
      var returnedData = await getIt<HomeService>().getPlacesByCity(
        cityId: cityId,
        filter: filter,
      );

      return returnedData.fold(
        (error) {
          _logger.e('HomeRepoImpl: Service error: $error');
          return Left(
            AppFailure(failureCode: FailureCode.server, message: error),
          );
        },
        (data) {
          try {
            _logger.d(
              'HomeRepoImpl: Mapping PlaceByCitiesModel to PlaceByCitiesEntity',
            );
            final placeByCitiesEntity = Mapper.mapPlaceByCitiesModelToEntity(
              data,
            );
            _logger.i(
              'HomeRepoImpl: Successfully mapped PlaceByCitiesEntity',
            );
            return Right(placeByCitiesEntity);
          } catch (e) {
            _logger.e('HomeRepoImpl: Mapping error: $e');
            return Left(
              AppFailure(
                failureCode: FailureCode.unknown,
                message: e.toString(),
              ),
            );
          }
        },
      );
    } catch (e) {
      _logger.e('HomeRepoImpl: Unexpected error: $e');
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<AppFailure, List<PackageEntity>>>
  getAiPackagesSuggestions() async {
    try {
      _logger.i(
        'HomeRepoImpl: Requesting ai packages suggestions data from service',
      );
      var returnedData = await getIt<HomeService>().getAiPackagesSuggestions();

      return returnedData.fold(
        (error) {
          _logger.e('HomeRepoImpl: Service error: $error');
          return Left(
            AppFailure(failureCode: FailureCode.server, message: error),
          );
        },
        (data) {
          try {
            _logger.d('HomeRepoImpl: Mapping PackageModels to PackageEntities');
            final packageEntities = data
                .map((e) => Mapper.mapPackageModelToEntity(e))
                .toList();
            _logger.i('HomeRepoImpl: Successfully mapped PackageEntities');
            return Right(packageEntities);
          } catch (e) {
            _logger.e('HomeRepoImpl: Mapping error: $e');
            return Left(
              AppFailure(
                failureCode: FailureCode.unknown,
                message: e.toString(),
              ),
            );
          }
        },
      );
    } catch (e) {
      _logger.e('HomeRepoImpl: Unexpected error: $e');
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<GetCategoriesResponse>>> getCategories() async {
    try {
      final result = await homeService.getCatogry();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
