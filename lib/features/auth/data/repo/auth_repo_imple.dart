import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/features/auth/data/data_source/Auth_remote_data_source.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_response_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/login_model.dart';
import 'package:guide_me/features/auth/data/models/login_request_model.dart';
import 'package:guide_me/features/auth/data/models/nationality_response_model.dart';
import 'package:guide_me/features/auth/data/models/register_mode.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImple extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final TokenService tokenService;
  final Logger _logger = Logger();

  AuthRepoImple(this.authRemoteDataSource, this.tokenService);
  @override
  Future<Either<Failure, LoginresponseModel>> login(
    LoginRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.login(request);
      await tokenService.saveToken(result.token!);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.register(request);
      await tokenService.saveToken(result.token);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ResendPasswordResponseModel>> resendPassword(
    ResendPasswordRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.resendPassword(request);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponseModel>> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.resetPassword(request);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SendForgetPasswordResponsetModel>> sendForgetPassword(
    SendForgetPasswordRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.sendForgetPassword(request);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyForgetPasswordResponse>> verifyForgetPassword(
    VerifyForgetPasswordRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.verifyForgetPassword(request);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginresponseModel>> loginwithgoogle(
    String token,
  ) async {
    try {
      _logger.i("Repository: Sending Google token to backend.");
      final result = await authRemoteDataSource.loginWithGoogle(token);
      _logger.i("Repository: Successfully logged in with Google via backend.");
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, NationalityResponseModel>> addNationality({
    required String nationality,
  }) async {
    // try {
    final result = await authRemoteDataSource.addNationality(
      nationality: nationality,
    );
    return Right(result);
    // } catch (e) {
    //   return Left(ErrorHandler.handle(e.toString()));
    // }
  }
}
