import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/guide_profile/data/models/add_certification_model.dart';

abstract class GuideProfileRepo {
  Future<Either<Failure, UserEntity>> updateGuideBio(String userId, String bio);
  Future<Either<Failure, UserEntity>> updateGuideLanguages(
    String userId,
    List<String> languages,
  );
  Future<Either<Failure, UserEntity>> addGuideCertification(
    String userId,
    AddCertificationModel certification,
  );
  Future<Either<Failure, UserEntity>> deleteGuideCertification(
    String userId,
    String certificationId,
  );
}