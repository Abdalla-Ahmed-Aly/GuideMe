import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/shared/mapper/user_mapper.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:guide_me/features/auth/data/data_source/Auth_remote_data_source.dart';
import 'package:guide_me/features/auth/data/mappers/auth_response_mapper.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_response_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_model.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_request_model.dart';
import 'package:guide_me/features/auth/data/models/login_request_model.dart';
import 'package:guide_me/features/auth/data/models/nationality_response_model.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/entities/auth_response_entity.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImple extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final TokenService tokenService;

  AuthRepoImple(this.authRemoteDataSource, this.tokenService);
  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.login(request);

      final data = AuthResponseMapper.toEntity(result);

      await tokenService.saveToken(data.token);

      await HiveHelper.put<String>(
        boxName: HiveConstants.userBox,
        key: HiveConstants.userKey,
        data: jsonEncode(result.data.toJson()),
      );

      await HiveHelper.put<UserRole>(
        boxName: HiveConstants.userRoleBox,
        key: HiveConstants.userRoleKey,
        data: UserRole.fromString(data.user.role.name),
      );

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterRequestModel request,
  ) async {
    try {
      final result = await authRemoteDataSource.register(request);
      await tokenService.saveToken(result.token);

      final data = AuthResponseMapper.toEntity(result);

      await HiveHelper.put<String>(
        boxName: HiveConstants.userBox,
        key: HiveConstants.userKey,
        data: jsonEncode(result.data.toJson()),
      );

      await HiveHelper.put<UserRole>(
        boxName: HiveConstants.userRoleBox,
        key: HiveConstants.userRoleKey,
        data: UserRole.fromString(data.user.role.name),
      );

      return Right(data);
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
  Future<Either<Failure, AuthResponseEntity>> loginwithgoogle(
    String token,
  ) async {
    try {
      final result = await authRemoteDataSource.loginWithGoogle(token);

      final data = AuthResponseMapper.toEntity(result);

      await tokenService.saveToken(data.token);

      await HiveHelper.put<String>(
        boxName: HiveConstants.userBox,
        key: HiveConstants.userKey,
        data: jsonEncode(result.data.toJson()),
      );

      await HiveHelper.put<UserRole>(
        boxName: HiveConstants.userRoleBox,
        key: HiveConstants.userRoleKey,
        data: UserRole.fromString(data.user.role.name),
      );

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, NationalityResponseModel>> addNationality({
    required String nationality,
  }) async {
    try {
      final result = await authRemoteDataSource.addNationality(
        nationality: nationality,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> addLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final result = await authRemoteDataSource.addLocation(
        latitude: latitude,
        longitude: longitude,
      );

      await HiveHelper.put<String>(
        boxName: HiveConstants.userBox,
        key: HiveConstants.userKey,
        data: jsonEncode(result.toJson()),
      );

      return Right(UserMapper.toEntity(result));
    } catch (e) {
      return Left(ErrorHandler.handle(e.toString()));
    }
  }
}
