import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateCachedUserUsecase {
  final ProfileLocalDataSource profileLocalDataSource;

  UpdateCachedUserUsecase(this.profileLocalDataSource);

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    try {
      final model = UserMapper.toModel(user);
      await profileLocalDataSource.cacheUser(model);
      return right(unit);
    } catch (e) {
      return left(const AppFailure(failureCode: FailureCode.cache));
    }
  }
}