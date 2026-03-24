import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/entities/auth_response_entity.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);
  Future<Either<Failure, AuthResponseEntity>> call(
    RegisterRequestModel param,
  ) async {
    print("UseCase call() called with: ${param.toJson()}"); 
    return await _authRepo.register(param);
  }
}
