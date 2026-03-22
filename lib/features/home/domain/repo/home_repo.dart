import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/models/category_model.dart';

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
