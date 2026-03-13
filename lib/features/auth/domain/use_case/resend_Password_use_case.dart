import 'package:dart_either/dart_either.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';

abstract class Usecase<type, params> {
  Future<Either<Failure, type>> call(params param);
}

class ResendPasswordUseCase
    extends Usecase<ResendPasswordResponseModel, ResendPasswordRequestModel> {
  final AuthRepo authRepo;

  ResendPasswordUseCase(this.authRepo);
  @override
  Future<Either<Failure, ResendPasswordResponseModel>> call(
    ResendPasswordRequestModel param,
  ) {
    return authRepo.resendPassword(param);
  }
}
