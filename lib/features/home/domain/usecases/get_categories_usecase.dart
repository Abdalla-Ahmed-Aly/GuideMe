import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoriesUsecase {
  final HomeRepo homeRepo;

  GetCategoriesUsecase(this.homeRepo);
  Future<Either<Failure, List<CategoryEntity>>> getcatogry() async {
    return await homeRepo.getCategories();
  }
}
