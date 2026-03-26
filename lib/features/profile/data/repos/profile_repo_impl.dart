import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:guide_me/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:guide_me/features/profile/data/models/update_profile_request_model.dart';
import 'package:guide_me/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImpl(this._profileRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> updateProfile(
    UpdateProfileRequestModel requestModel,
  ) async {
    try {
      final data = await _profileRemoteDataSource.updateProfile(requestModel);
      final user = UserMapper.toEntity(data);

      return right(user);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
