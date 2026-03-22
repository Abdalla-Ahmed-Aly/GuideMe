import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/home/data/model/get_catogry_copy.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';

class GetCategoriesUsecase {
  final HomeRepo homeRepo;

  GetCategoriesUsecase(this.homeRepo);
  Future<Either<Failure, List<GetCategoriesResponse>>> getcatogry() async {
    return await homeRepo.getCategories();
  }
}
