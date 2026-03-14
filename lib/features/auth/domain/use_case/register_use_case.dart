
import 'package:dart_either/dart_either.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/register_mode.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

abstract class Usecase<type, params> {
  Future<Either<Failure, type>> call(params param);
}
@injectable

class RegisterUseCase extends Usecase<RegisterResponseModel,RegisterRequestModel> {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo)
  ;@override
  Future<Either<Failure, RegisterResponseModel>> call(RegisterRequestModel param) {
  return _authRepo.register( param);
  }

}