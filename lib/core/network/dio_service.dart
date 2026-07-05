import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/api_constants.dart';
import 'interceptor.dart';

@lazySingleton
class DioService {
  late final Dio dio;

  DioService();

  Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (kDebugMode) {
      dio.interceptors.addAll([
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
      ]);
    } else {
      dio.interceptors.addAll([
        AuthorizationInterceptor(),
        LoggerInterceptor(),
      ]);
    }

    await _addCacheInterceptor();
  }

  Future<void> _addCacheInterceptor() async {
    try {
      final cacheOptions = await _getCacheOptions();
      dio.interceptors.insert(0, DioCacheInterceptor(options: cacheOptions));
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DioService: Failed to initialize cache interceptor: $e');
      }
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
