import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/login_model.dart';
import 'package:guide_me/features/auth/data/models/login_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';



@injectable
class LoginUseCase  {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);
  Future<Either<Failure, LoginresponseModel>> call(
    LoginRequestModel param,
  )  {
    return  _authRepo.login(param);
  }
}
