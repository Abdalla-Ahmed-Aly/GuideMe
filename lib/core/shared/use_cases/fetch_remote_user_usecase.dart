import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FetchRemoteUserUsecase {
  final ProfileRepo profileRepo;

  FetchRemoteUserUsecase(this.profileRepo);

  Future<Either<Failure, UserEntity>> call() {
    return profileRepo.fetchProfile();
  }
}
