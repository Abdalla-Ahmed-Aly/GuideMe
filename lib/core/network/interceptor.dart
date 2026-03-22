import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/services/token/token_service.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d(
      'Error type: ${err.type} \n '
      'Error message: ${err.message} \n'
      'STATUS CODE: ${err.response?.statusCode} \n'
      'RESPONSE DATA: ${err.response?.data}'
      'Error type: ${err.error} \n '
      'Error message: ${err.message}',
    ); //Debug log
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'STATUSCODE: ${response.statusCode} \n '
      'STATUSMESSAGE: ${response.statusMessage} \n'
      'HEADERS: ${response.headers} \n'
      'Data: ${response.data}',
    ); // Debug log
    handler.next(response); // continue with the Response
  }
}

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await getIt<TokenService>().getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = "Bearer $token";
      }
    } catch (e) {
      Logger().e('AuthorizationInterceptor: Error fetching token: $e');
    }

    handler.next(options); // لازم تتنادى مرة واحدة بس
  }
}
