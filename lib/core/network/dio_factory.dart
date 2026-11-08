import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static final _instanse = DioFactory._();
  factory DioFactory() => _instanse;
  final _storage = SecureStorageCacheing();
  late final Dio dio = _setupDio();

  Dio _setupDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstatnt.baseUrl,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final refreshToken = await _storage.getRefreshToken();
            if (refreshToken != null) {
              try {
                final res =
                    await Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl)).post(
                  ApiConstatnt.refreshTokenEndPoint,
                  data: {'refreshToken': refreshToken},
                );
                final newAccessToken = res.data['accessToken'];
                await _storage.saveAuthData(
                  accessToken: newAccessToken,
                  refreshToken: res.data['refreshToken'],
                  expiresAt: DateTime.parse(res.data['expiresAtUtc']),
                );

                final options = error.requestOptions;
                options.headers['Authorization'] = 'Bearer $newAccessToken';
                return handler.resolve(await dio.fetch(options));
              } catch (_) {
                await _storage.clearCache();
              }
            }
          }
          handler.next(error);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if (options.path.contains('/posts')) return false;
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );

    return dio;
  }
}