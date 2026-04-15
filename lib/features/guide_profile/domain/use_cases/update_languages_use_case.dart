import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/features/guide_profile/domain/repos/guide_profile_repo.dart';

@LazySingleton()
class UpdateLanguagesUseCase {
  final GuideProfileRepo _guideProfileRepo;
  UpdateLanguagesUseCase(this._guideProfileRepo);

  Future<Either<Failure, UserEntity>> call({
    required String userId,
    required List<String> languages,
  }) async {
    return await _guideProfileRepo.updateGuideLanguages(
      userId,
      languages,
    );
  }
}