import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/features/auth/data/models/auth_response_model.dart';
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
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);

  Future<SendForgetPasswordResponsetModel> sendForgetPassword(
    SendForgetPasswordRequestModel request,
  );
  Future<VerifyForgetPasswordResponse> verifyForgetPassword(
    VerifyForgetPasswordRequestModel request,
  );
  Future<ResendPasswordResponseModel> resendPassword(
    ResendPasswordRequestModel request,
  );
  Future<ResetPasswordResponseModel> resetPassword(
    ResetPasswordRequestModel request,
  );
  Future<AuthResponseModel> loginWithGoogle(String token);
  Future<NationalityResponseModel> addNationality({
    required String nationality,
  });
  Future<UserModel> addLocation({
    required double latitude,
    required double longitude,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await apiService.post(
      endpoint: ApiConstants.loginEndPoint,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    final response = await apiService.post(
      endpoint: ApiConstants.registerEndPoint,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<ResendPasswordResponseModel> resendPassword(
    ResendPasswordRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint:
          "${ApiConstants.otpBaseUrl}${ApiConstants.resendPasswordEndPoint}",
      data: request.toJson(),
    );
    return ResendPasswordResponseModel.fromJson(response.data);
  }

  @override
  Future<ResetPasswordResponseModel> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint: ApiConstants.resetPasswordEndPoint,
      data: request.toJson(),
    );

    return ResetPasswordResponseModel.fromJson(response.data);
  }

  @override
  Future<SendForgetPasswordResponsetModel> sendForgetPassword(
    SendForgetPasswordRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint:
          "${ApiConstants.otpBaseUrl}${ApiConstants.sendForgetPasswordEndPoint}",
      data: request.toJson(),
    );
    return SendForgetPasswordResponsetModel.fromJson(response.data);
  }

  @override
  Future<VerifyForgetPasswordResponse> verifyForgetPassword(
    VerifyForgetPasswordRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint: ApiConstants.verifyForgetPasswordEndPoint,
      data: request.toJson(),
    );
    return VerifyForgetPasswordResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> loginWithGoogle(String token) async {
    final response = await apiService.post(
      endpoint: ApiConstants.loginWithGoogleEndPoint,
      headers: {"Authorization": "Bearer $token"},
      data: {"token": token},
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<NationalityResponseModel> addNationality({
    required String nationality,
  }) async {
    final response = await apiService.patch(
      endpoint: ApiConstants.addNationalityEndPoint,
      data: {"nationality": nationality},
    );
    return NationalityResponseModel.fromJson(response.data['data']);
  }

  @override
  Future<UserModel> addLocation({
    required double latitude,
    required double longitude,
  }) async {
    final response = await apiService.post(
      endpoint: ApiConstants.locationEndPoint,
      data: {"lat": latitude, "long": longitude},
    );
    return UserModel.fromJson(response.data['data']['user']);
  }
}
