import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetAiPackageUsecase extends Usecase<Either, dynamic> {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either<dynamic, List<PackageEntity>>> call({params}) async {
    _logger.i('GetAiPackageUsecase: Requesting AI packages from repository');
    final result = await getIt<HomeRepo>().getAiPackagesSuggestions();

    return result.fold(
      (failure) {
        _logger.e(
          'GetAiPackageUsecase: Repository returned failure: ${failure.message}',
        );
        return Left(failure);
      },
      (packages) {
        _logger.i(
          'GetAiPackageUsecase: Repository returned ${packages.length} packages',
        );
        return Right(packages);
      },
    );
  }
}
