import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

class PlaceByCategoryParams {
  final String categoryId;
  final String filter;

  PlaceByCategoryParams({required this.categoryId, required this.filter});
}

@injectable
class PlaceByCategoryUsecase extends Usecase<Either, PlaceByCategoryParams> {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either> call({PlaceByCategoryParams? params}) async {
    _logger.i(
      'PlaceByCategoryUsecase: Calling home repository for category: ${params?.categoryId} with filter: ${params?.filter}',
    );
    final result = await getIt<HomeRepo>().getPlacesByCategory(
      categoryId: params!.categoryId,
      filter: params.filter,
    );
    result.fold(
      (failure) => _logger.e(
        'PlaceByCategoryUsecase: Repository returned failure: ${failure.message}',
      ),
      (success) =>
          _logger.i('PlaceByCategoryUsecase: Repository returned success'),
    );
    return result;
  }
}
