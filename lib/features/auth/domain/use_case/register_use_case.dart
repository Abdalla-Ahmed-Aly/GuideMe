import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/register_mode.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);
  Future<Either<Failure, RegisterResponseModel>> call(
    RegisterRequestModel param,
  ) async {
    print("UseCase call() called with: ${param.toJson()}"); 
    return await _authRepo.register(param);
  }
}
