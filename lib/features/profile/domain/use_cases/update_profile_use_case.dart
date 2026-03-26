import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/profile/data/models/update_profile_request_model.dart';
import 'package:guide_me/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfileUseCase {
  final ProfileRepo _profileRepo;

  UpdateProfileUseCase(this._profileRepo);

  Future<Either<Failure, UserEntity>> call(
    UpdateProfileRequestModel requestModel,
  ) async {
    return await _profileRepo.updateProfile(requestModel);
  }
}
