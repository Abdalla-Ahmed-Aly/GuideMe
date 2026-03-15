import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_response_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

abstract class Usecase<type, params> {
  Future<Either<Failure, type>> call(params param);
}
@injectable
class ResetPasswordUseCase
    extends Usecase<ResetPasswordResponseModel, ResetPasswordRequestModel> {
  final AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);
  @override
  Future<Either<Failure, ResetPasswordResponseModel>> call(
    ResetPasswordRequestModel param,
  ) {
    return authRepo.resetPassword(param);
  }
}
