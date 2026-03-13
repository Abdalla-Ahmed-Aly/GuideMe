import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/features/home/data/model/home_model.dart';
import 'package:guide_me/features/home/data/sources/home_sources.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    try {
      _logger.i('HomeRepoImpl: Requesting home data from service');
      var returnedData = await getIt<HomeService>().getHomeData();
      return returnedData.fold(
        (error) {
          _logger.e('HomeRepoImpl: Service error: $error');
          return Left(
            AppFailure(failureCode: FailureCode.server, message: error),
          );
        },
        (data) {
          try {
            _logger.d('HomeRepoImpl: Parsing data to HomeModel');
            final homeModel = HomeModel.fromJson(data);
            _logger.i('HomeRepoImpl: Successfully parsed HomeModel');
            return Right(homeModel);
          } catch (e) {
            _logger.e('HomeRepoImpl: Parsing error: $e');
            return Left(
              AppFailure(
                failureCode: FailureCode.unknown,
                message: e.toString(),
              ),
            );
          }
        },
      );
    } catch (e) {
      _logger.e('HomeRepoImpl: Unexpected error: $e');
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }
}
