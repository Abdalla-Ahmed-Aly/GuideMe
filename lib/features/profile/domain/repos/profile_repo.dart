import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/profile/data/models/update_profile_request_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> updateProfile(
    UpdateProfileRequestModel requestModel,
  );
  Future<Either<Failure, UserEntity>> fetchProfile();
  Future<Either<Failure, void>> logout();
}
