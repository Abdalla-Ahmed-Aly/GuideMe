import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/login_request_model.dart';
import 'package:guide_me/features/auth/data/models/nationality_response_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_response_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponseEntity>> login(LoginRequestModel request);

  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterRequestModel request,
  );

  Future<Either<Failure, SendForgetPasswordResponsetModel>> sendForgetPassword(
    SendForgetPasswordRequestModel request,
  );

  Future<Either<Failure, VerifyForgetPasswordResponse>> verifyForgetPassword(
    VerifyForgetPasswordRequestModel request,
  );

  Future<Either<Failure, ResendPasswordResponseModel>> resendPassword(
    ResendPasswordRequestModel request,
  );

  Future<Either<Failure, ResetPasswordResponseModel>> resetPassword(
    ResetPasswordRequestModel request,
  );

  Future<Either<Failure, AuthResponseEntity>> loginwithgoogle(String token);
  Future<Either<Failure, NationalityResponseModel>> addNationality({
    required String nationality,
  });
}
