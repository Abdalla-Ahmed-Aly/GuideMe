import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClearCachedUserUsecase {
  final ProfileLocalDataSource profileLocalDataSource;

  ClearCachedUserUsecase(this.profileLocalDataSource);

  Future<Either<Failure, Unit>> call() async {
    try {
      await profileLocalDataSource.clearUser();
      return right(unit);
    } catch (e) {
      return left(const AppFailure(failureCode: FailureCode.cache));
    }
  }
}