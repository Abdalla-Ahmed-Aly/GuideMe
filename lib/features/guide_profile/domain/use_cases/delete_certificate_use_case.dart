import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/guide_profile/domain/repos/guide_profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteCertificateUseCase {
  final GuideProfileRepo _guideProfileRepo;
  DeleteCertificateUseCase(this._guideProfileRepo);

  Future<Either<Failure, UserEntity>> call(
    String userId,
    String certificationId,
  ) async {
    return await _guideProfileRepo.deleteGuideCertification(
      userId,
      certificationId,
    );
  }
}