import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/api_constants.dart';
import 'interceptor.dart';

@lazySingleton
class DioService {
  late final Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll(
      [
        AuthorizationInterceptor(),
        LoggerInterceptor(),
        LogInterceptor(
          request: true,
          error: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      ],
    );

    _addCacheInterceptor();
  }

  Future<void> _addCacheInterceptor() async {
    try {
      final cacheOptions = await _getCacheOptions();
      // Add cache interceptor at the beginning of the list
      dio.interceptors.insert(0, DioCacheInterceptor(options: cacheOptions));
    } catch (e) {
      // Log error if cache fails to initialize
      print('DioService: Failed to initialize cache interceptor: $e');
    }
  }

  Future<CacheOptions> _getCacheOptions() async {
    final dir = await getTemporaryDirectory();
    return CacheOptions(
      store: FileCacheStore(dir.path),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
  }
}
