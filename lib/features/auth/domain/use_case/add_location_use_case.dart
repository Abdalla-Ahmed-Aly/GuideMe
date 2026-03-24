import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddLocationUseCase {
  final AuthRepo authRepo;

  AddLocationUseCase(this.authRepo);

  Future<Either<Failure, UserEntity>> call({
    required double latitude,
    required double longitude,
  }) async {
    return await authRepo.addLocation(latitude: latitude, longitude: longitude);
  }
}