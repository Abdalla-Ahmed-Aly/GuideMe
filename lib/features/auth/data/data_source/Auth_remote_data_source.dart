import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
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
import 'package:guide_me/features/auth/data/models/register_mode.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<LoginresponseModel> login(LoginRequestModel request);
  Future<RegisterResponseModel> register(RegisterRequestModel request);

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
  Future<LoginresponseModel> loginWithGoogle(String token);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<LoginresponseModel> login(LoginRequestModel request) async {
    final response = await apiService.post(
      endpoint: ApiConstants.loginEndPoint,
      data: request.toJson(),
    );
    return LoginresponseModel.fromJson(response.data);
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    final response = await apiService.post(
      endpoint: ApiConstants.registerEndPoint,
      data: request.toJson(),
    );
    return RegisterResponseModel.fromJson(response.data);
  }

  @override
  Future<ResendPasswordResponseModel> resendPassword(
    ResendPasswordRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint: ApiConstants.resendPasswordEndPoint,
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
    print("Received response: ${response.data}");
    return ResetPasswordResponseModel.fromJson(response.data);
  }

  @override
  Future<SendForgetPasswordResponsetModel> sendForgetPassword(
    SendForgetPasswordRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint: ApiConstants.sendForgetPasswordEndPoint,
      data: request.toJson(),
    );
    return SendForgetPasswordResponsetModel.fromJson(response.data);
  }

  @override
  Future<VerifyForgetPasswordResponse> verifyForgetPassword(
    VerifyForgetPasswordRequestModel request,
  ) async {
    print(
      "Sending verify-otp request with: email=${request.email}, otp=${request.forgotPasswordOTP}",
    );
    final response = await apiService.post(
      endpoint: ApiConstants.verifyForgetPasswordEndPoint,
      data: request.toJson(),
    );
    //  print("Received response: ${response.data}");
    return VerifyForgetPasswordResponse.fromJson(response.data);
  }
  
  @override
  Future<LoginresponseModel> loginWithGoogle(String token) async{
  final response = await apiService.post(endpoint:ApiConstants.loginWithGoogleEndPoint  , data: {"token" : token});
   if (response.data == null) {
    throw Exception("Google login response is null");
  }

  return LoginresponseModel.fromJson(response.data);
  }
  

}
