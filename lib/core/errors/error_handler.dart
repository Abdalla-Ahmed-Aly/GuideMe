import 'dart:io';
import 'package:dio/dio.dart';

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
          failureCode: FailureCode.badRequest,
          message: serverMessage,
        );

      case 401:
        if (serverMessage.toLowerCase().contains("token")) {
          return AppFailure(
            failureCode: FailureCode.sessionExpired,
            message: serverMessage,
          );
        }
        return AppFailure(
          failureCode: FailureCode.unauthorized,
          message: serverMessage,
        );

      case 403:
        return AppFailure(
          failureCode: FailureCode.forbidden,
          message: serverMessage,
        );

      case 404:
        return AppFailure(
          failureCode: FailureCode.notFound,
          message: serverMessage,
        );

      case 409:
        return AppFailure(
          failureCode: FailureCode.conflict,
          message: serverMessage,
        );

      case 422:
        return AppFailure(
          failureCode: FailureCode.validation,
          message: serverMessage,
        );

      case 500:
      case 502:
      case 503:
        return AppFailure(
          failureCode: FailureCode.server,
          message: serverMessage,
        );

      default:
        return AppFailure(
          failureCode: FailureCode.unknown,
          message: serverMessage,
        );
    }
  }
}