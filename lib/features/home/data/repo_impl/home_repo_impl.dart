import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/core/shared/mapper/category_mapper.dart';
import 'package:guide_me/features/home/data/mappers/home_mapper.dart';
import 'package:guide_me/features/home/data/mappers/package_mapper.dart';
import 'package:guide_me/features/home/data/mappers/place_by_category_mapper.dart';
import 'package:guide_me/features/home/data/mappers/place_by_city_mapper.dart';
import 'package:guide_me/features/home/data/model/add_interests_request_model.dart';
import 'package:guide_me/features/home/data/sources/home_sources.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/domain/entity/place_by_category_entity.dart';
import 'package:guide_me/features/home/domain/entity/place_by_cities_entity.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeService homeService;

  HomeRepoImpl(this.homeService);

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    try {
      final returnedData = await homeService.getHomeData();

      return Right(HomeMapper.toEntity(returnedData));
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, PlaceByCategoryEntity>> getPlacesByCategory({
    required String categoryId,
    required String filter,
  }) async {
    try {
      final returnedData = await homeService.getPlacesByCategory(
        categoryId: categoryId,
        filter: filter,
      );

      final placeByCategoryEntity = PlaceByCategoryMapper.toEntity(
        returnedData,
      );
      return Right(placeByCategoryEntity);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, PlaceByCitiesEntity>> getPlacesByCity({
    required String cityId,
    required String filter,
  }) async {
    try {
      final returnedData = await homeService.getPlacesByCity(
        cityId: cityId,
        filter: filter,
      );

      final placeByCitiesEntity = PlaceByCityMapper.toEntity(returnedData);

      return Right(placeByCitiesEntity);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<PackageEntity>>>
  getAiPackagesSuggestions() async {
    try {
      final returnedData = await homeService.getAiPackagesSuggestions();

      return Right(returnedData.map((e) => PackageMapper.toEntity(e)).toList());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await homeService.getCatogries();
      return Right(result.map((e) => CategoryMapper.toEntity(e)).toList());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> addInterests({
    required AddInterestsRequestModel interests,
  }) async {
    try {
      final result = await homeService.addInterests(
        interests: interests,
      );
      return Right(result.map((e) => CategoryMapper.toEntity(e)).toList());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
