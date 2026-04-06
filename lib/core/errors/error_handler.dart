import 'dart:io';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:guide_me/core/constants/api_error_messages.dart';
import 'exceptions.dart';
import 'failure.dart';
import 'failure_code.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDio(error);
    } else if (error is SocketException) {
      return const AppFailure(failureCode: FailureCode.network);
    } else if (error is NoInternetException) {
      return const AppFailure(failureCode: FailureCode.network);
    } else if (error is LocationPermissionDeniedException) {
      return const AppFailure(
        failureCode: FailureCode.locationPermissionDenied,
      );
    } else if (error is LocationPermissionDeniedForeverException) {
      return const AppFailure(
        failureCode: FailureCode.locationPermissionDeniedForever,
      );
    } else if (error is LocationServiceDisabledException) {
      return const AppFailure(failureCode: FailureCode.locationServiceDisabled);
    }

    return const AppFailure(failureCode: FailureCode.unknown);
  }

  static Failure _handleDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppFailure(failureCode: FailureCode.timeout);

      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        return const AppFailure(failureCode: FailureCode.network);

      case DioExceptionType.badResponse:
        return _handleBadResponse(
          error.response?.statusCode ?? 0,
          error.response?.data,
        );

      case DioExceptionType.cancel:
        return const AppFailure(failureCode: FailureCode.cancelled);

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const AppFailure(failureCode: FailureCode.network);
        }
        return const AppFailure(failureCode: FailureCode.unknown);
    }
  }

  static Failure _handleBadResponse(
    int statusCode,
    dynamic data,
  ) {
    final String serverMessage = data is Map<String, dynamic>
        ? data['message']?.toString() ?? "Unknown error occurred"
        : "Unknown error occurred";

    switch (statusCode) {
      case 400:
        return AppFailure(
          failureCode: _handleServerMessage(
            serverMessage,
            FailureCode.badRequest,
          ),
          message: serverMessage,
        );

      case 401:
        return AppFailure(
          failureCode: _handleServerMessage(
            serverMessage,
            FailureCode.unauthorized,
          ),
          message: serverMessage,
        );

      case 403:
        return AppFailure(
          failureCode: _handleServerMessage(
            serverMessage,
            FailureCode.forbidden,
          ),
          message: serverMessage,
        );

      case 404:
        return AppFailure(
          failureCode: _handleServerMessage(
            serverMessage,
            FailureCode.notFound,
          ),
          message: serverMessage,
        );

      case 409:
        return AppFailure(
          failureCode: _handleServerMessage(
            serverMessage,
            FailureCode.conflict,
          ),
          message: serverMessage,
        );

      case 422:
        return AppFailure(
          failureCode: _handleServerMessage(
            serverMessage,
            FailureCode.validation,
          ),
          message: serverMessage,
        );

      case 500:
      case 502:
      case 503:
        return AppFailure(
          failureCode: _handleServerMessage(serverMessage, FailureCode.server),
          message: serverMessage,
        );

      default:
        return AppFailure(
          failureCode: _handleServerMessage(serverMessage, FailureCode.unknown),
          message: serverMessage,
        );
    }
  }

  static FailureCode _handleServerMessage(
    String? message,
    FailureCode fallback,
  ) {
    if (message == null) return fallback;
    final msg = message.toLowerCase();
    if (msg.contains(ApiErrorMessages.emailNotRegistered)) {
      return FailureCode.emailNotRegistered;
    }
    if (msg.contains(ApiErrorMessages.emailAlreadyRegistered)) {
      return FailureCode.emailAlreadyRegistered;
    }
    if (msg.contains(ApiErrorMessages.invalidEmailOrPassword)) {
      return FailureCode.invalidEmailOrPassword;
    }
    if (msg.contains(ApiErrorMessages.tokenExpired)) {
      return FailureCode.sessionExpired;
    }
    if (msg.contains(ApiErrorMessages.userNotFound)) {
      return FailureCode.userNotFound;
    }
    if (msg.contains(ApiErrorMessages.otpExpired)) {
      return FailureCode.otpExpired;
    }
    if (msg.contains(ApiErrorMessages.invalidOtp)) {
      return FailureCode.invalidOtp;
    }
    if (msg.contains(ApiErrorMessages.placeAlreadyBooked)) {
      return FailureCode.placeAlreadyBooked;
    }
    if (msg.contains(ApiErrorMessages.youAlreadyHaveATripOnThisDay)) {
      return FailureCode.youAlreadyHaveATripOnThisDay;
    }
    if (msg.contains(ApiErrorMessages.tourCanOnlyBeStartedOnTheBookingDay)) {
      return FailureCode.tourCanOnlyBeStartedOnTheBookingDay;
    }
    return fallback;
  }
}
