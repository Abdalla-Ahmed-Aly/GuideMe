import 'package:dart_either/dart_either.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/login_model.dart';
import 'package:guide_me/features/auth/data/models/register_mode.dart';
import 'package:guide_me/features/auth/data/models/resend_password_model.dart';
import 'package:guide_me/features/auth/data/models/reset_password_response_model.dart';
import 'package:guide_me/features/auth/data/models/send_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/verfiy_forget_password_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginresponseModel>> lgoinrequest();
  Future<Either<Failure, RegisterResponseModel>> registrerequest();
  Future<Either<Failure, SendForgetPasswordResponsetModel>>
  sendForgetPasswordReques();
  Future<Either<Failure, VerifyForgetPasswordResponse>>
  verifyForgetPasswordRequest();
  Future<Either<Failure, ResendPasswordResponseModel>> resendPasswordRequest();
  Future<Either<Failure, ResetPasswordResponse>> resetpasswordrequest();

}
