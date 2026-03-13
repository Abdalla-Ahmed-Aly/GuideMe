import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/api_constants.dart';
import 'interceptor.dart';

@lazySingleton
class DioService {
  late final Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
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
        // InterceptorsWrapper(
        //   onRequest: (options, handler) {
        //     options.headers['Authorization'] =
        //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YTJmZTBjZDg0NjI5MDhjYjlhYTVhYiIsInJvbGUiOiJ0b3VyaXN0IiwiaWF0IjoxNzcyMjg5NjE4fQ.SUrwoofufEYnl9fhhZZ6NvWjyF4gr5sWB4X92yDYkhk';
        //   },
        // ),
      ],
    );
  }
}
