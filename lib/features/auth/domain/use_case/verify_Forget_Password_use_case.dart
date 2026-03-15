import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

abstract class Usecase<type, params> {
  Future<Either<Failure, type>> call(params param);
}
@injectable
class VerifyForgetPasswordUseCase
    extends
        Usecase<
          VerifyForgetPasswordResponse,
          VerifyForgetPasswordRequestModel
        > {
  final AuthRepo _authRepo;

  VerifyForgetPasswordUseCase(this._authRepo);
  @override
  Future<Either<Failure, VerifyForgetPasswordResponse>> call(
    VerifyForgetPasswordRequestModel param,
  ) {
    return _authRepo.verifyForgetPassword(param);
  }
}
