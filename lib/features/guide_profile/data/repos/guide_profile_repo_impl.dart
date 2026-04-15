import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:guide_me/features/guide_profile/data/models/add_certification_model.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/guide_profile/data/data_sources/remote/guide_profile_remote_data_source.dart';
import 'package:guide_me/features/guide_profile/domain/repos/guide_profile_repo.dart';

@LazySingleton(as: GuideProfileRepo)
class GuideProfileRepoImpl implements GuideProfileRepo {
  final GuideProfileRemoteDataSource _guideProfileRemoteDataSource;
  GuideProfileRepoImpl(this._guideProfileRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> updateGuideBio(
    String userId,
    String bio,
  ) async {
    try {
      await _guideProfileRemoteDataSource.updateGuideBio(bio);

      final result = await _guideProfileRemoteDataSource.getGuideProfile(
        userId,
      );

      return right(UserMapper.toEntity(result));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateGuideLanguages(
    String userId,
    List<String> languages,
  ) async {
    try {
      await _guideProfileRemoteDataSource.updateGuideLanguages(languages);

      final result = await _guideProfileRemoteDataSource.getGuideProfile(
        userId,
      );

      return right(UserMapper.toEntity(result));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> addGuideCertification(
    String userId,
    AddCertificationModel certification,
  ) async {
    try {
      await _guideProfileRemoteDataSource.addGuideCertification(
        certification,
      );

      final result = await _guideProfileRemoteDataSource.getGuideProfile(
        userId,
      );

      return right(UserMapper.toEntity(result));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> deleteGuideCertification(
    String userId,
    String certificationId,
  ) async {
    try {
      await _guideProfileRemoteDataSource.deleteGuideCertification(
        certificationId,
      );

      final result = await _guideProfileRemoteDataSource.getGuideProfile(
        userId,
      );

      return right(UserMapper.toEntity(result));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
