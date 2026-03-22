import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/home/data/model/get_catogry_copy.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/domain/entity/place_by_category_entity.dart';
import 'package:guide_me/features/home/domain/entity/place_by_cities_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeEntity>> getHomeData();
  Future<Either<Failure, PlaceByCategoryEntity>> getPlacesByCategory({
    required String categoryId,
    required String filter,
  });

  Future<Either<Failure, PlaceByCitiesEntity>> getPlacesByCity({
    required String cityId,
    required String filter,
  });

  Future<Either<Failure, List<PackageEntity>>> getAiPackagesSuggestions();

  Future<Either<Failure, List<GetCategoriesResponse>>> getCategories();
}
