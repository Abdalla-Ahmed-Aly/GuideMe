import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

class PlaceByCityParams {
  final String cityId;
  final String filter;

  PlaceByCityParams({required this.cityId, required this.filter});
}

@injectable
class PlaceByCityUsecase extends Usecase<Either, PlaceByCityParams> {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either> call({PlaceByCityParams? params}) async {
    _logger.i(
      'PlaceByCityUsecase: Calling home repository for city: ${params?.cityId} with filter: ${params?.filter}',
    );
    final result = await getIt<HomeRepo>().getPlacesByCity(
      cityId: params!.cityId,
      filter: params.filter,
    );
    result.fold(
      (failure) => _logger.e(
        'PlaceByCityUsecase: Repository returned failure: ${failure.message}',
      ),
      (success) => _logger.i('PlaceByCityUsecase: Repository returned success'),
    );
    return result;
  }
}
