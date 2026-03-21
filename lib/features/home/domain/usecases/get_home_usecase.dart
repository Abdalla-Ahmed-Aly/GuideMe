import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:logger/logger.dart';

class GetHomeUsecase extends Usecase<Either, int> {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either> call({int? params}) async {
    _logger.i('GetHomeUsecase: Calling home repository');
    final result = await getIt<HomeRepo>().getHomeData();
    result.fold(
      (failure) => _logger.e(
        'GetHomeUsecase: Repository returned failure: ${failure.message}',
      ),
      (success) => _logger.i('GetHomeUsecase: Repository returned success'),
    );
    return result;
  }
}
