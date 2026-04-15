import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/guide_profile/data/models/add_certification_model.dart';
import 'package:guide_me/features/guide_profile/domain/repos/guide_profile_repo.dart';

@LazySingleton()
class AddCertificationUseCase{
  final GuideProfileRepo _guideProfileRepo;
  AddCertificationUseCase(this._guideProfileRepo);

  Future<Either<Failure, UserEntity>> call(
    String userId,
    AddCertificationModel certification,
  ) async {
    return await _guideProfileRepo.addGuideCertification(
      userId,
      certification,
    );
  }
}