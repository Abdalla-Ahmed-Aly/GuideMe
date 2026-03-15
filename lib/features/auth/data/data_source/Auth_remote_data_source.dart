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
  final fullUrl = 'https://guide-me-back-end.vercel.app/api/auth/register';
  print("Sending request to API: $fullUrl");
  print("Request body: ${request.toJson()}");

  try {
    final response = await apiService.post(
      endpoint: fullUrl, // استخدمي الـ URL كامل عشان تتأكدي
      data: request.toJson(),
      headers: {
        'Content-Type': 'application/json', // مهم جداً للبعض APIs
      },
    ).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw Exception('Request timed out after 60 seconds');
      },
    );

    // Logging response
    print("API response data: ${response.data}");
    print("Status code: ${response.statusCode}");

    if (response.statusCode == 404) {
      throw Exception('Endpoint not found! Check the URL.');
    } else if (response.statusCode != 200) {
      throw Exception('API returned status code ${response.statusCode}');
    }

    return RegisterResponseModel.fromJson(response.data);
  } catch (e, st) {
    print("Exception in RemoteDataSource.register(): $e");
    print("Stack trace: $st");
    throw e; // سيتم التعامل معه في Repository
  }
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
    final response = await apiService.post(
      endpoint: ApiConstants.verifyForgetPasswordEndPoint,
      data: request.toJson(),
    );
    return VerifyForgetPasswordResponse.fromJson(response.data);
  }
}
