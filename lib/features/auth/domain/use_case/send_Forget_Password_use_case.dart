import 'package:dart_either/dart_either.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';

abstract class Usecase<type, params> {
  Future<Either<Failure, type>> call(params param);
}

class SendForgetPasswordUseCase
    extends
        Usecase<
          SendForgetPasswordResponsetModel,
          SendForgetPasswordRequestModel
        > {
  final AuthRepo authRepo;

  SendForgetPasswordUseCase(this.authRepo);
  @override
  Future<Either<Failure, SendForgetPasswordResponsetModel>> call(
    SendForgetPasswordRequestModel param,
  ) {
    return authRepo.sendForgetPassword(param);
  }
}
