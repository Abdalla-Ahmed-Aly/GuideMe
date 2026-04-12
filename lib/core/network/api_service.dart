import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../errors/exceptions.dart';
import '../helpers/connectivity_helper.dart';
import 'dio_service.dart';

@lazySingleton
class ApiService {
  late final Dio _dio;
  final ConnectivityHelper connectivityHelper;

  ApiService(DioService dioService, this.connectivityHelper)
    : _dio = dioService.dio;

  Future<void> _checkInternet() async {
    final isConnected = await connectivityHelper.isConnected();
    if (!isConnected) {
      throw NoInternetException();
    }
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      data: data,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> patch({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }
}
