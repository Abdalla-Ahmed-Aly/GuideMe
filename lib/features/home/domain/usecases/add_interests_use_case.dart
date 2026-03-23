import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/features/home/data/model/add_interests_request_model.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddInterestsUseCase {
  final HomeRepo homeRepo;

  AddInterestsUseCase(this.homeRepo);

  Future<Either<Failure, List<CategoryEntity>>> call(
    AddInterestsRequestModel interests,
  ) {
    return homeRepo.addInterests(interests: interests);
  }
}
