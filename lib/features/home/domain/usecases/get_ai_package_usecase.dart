import 'package:dartz/dartz.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAiPackageUsecase extends Usecase<Either, dynamic> {
  final HomeRepo homeRepo;

  GetAiPackageUsecase(this.homeRepo);

  @override
  Future<Either<dynamic, List<PackageEntity>>> call({params}) async {
    return await homeRepo.getAiPackagesSuggestions();
  }
}
