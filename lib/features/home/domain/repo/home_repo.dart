import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/home/data/model/get_catogry_copy.dart';

abstract class HomeRepo {
  Future<Either> getHomeData();
  Future<Either> getPlacesByCategory({
    required String categoryId,
    required String filter,
  });

  Future<Either> getPlacesByCity({
    required String cityId,
    required String filter,
  });

  Future<Either> getAiPackagesSuggestions();

  Future<Either<Failure, List<GetCategoriesResponse>>> getCategories();
}
