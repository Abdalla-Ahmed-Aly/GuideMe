import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCachedUserUsecase {
  final ProfileLocalDataSource profileLocalDataSource;

  GetCachedUserUsecase(this.profileLocalDataSource);

  Either<Failure, UserEntity?> call() {
    try {
      final user = profileLocalDataSource.getCachedUser();
      if (user == null) return right(null);

      return right(UserMapper.toEntity(user));
    } catch (e) {
      return left(const AppFailure(failureCode: FailureCode.cache));
    }
  }
}
