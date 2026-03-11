import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'interceptor.dart';

@lazySingleton
class DioService {
  late final Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        // baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dioInterceptors();
  }

  void _dioInterceptors() {
    dio.interceptors.addAll(
      [
        AuthorizationInterceptor(),
        LoggerInterceptor(),
      ],
    );
  }
}
