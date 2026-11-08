import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static final _instanse = DioFactory._();
  factory DioFactory() => _instanse;
  late final Dio dio = _setupDio();
  Dio _setupDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstatnt.baseUrl,
        connectTimeout: Duration(minutes: 1),
        receiveTimeout: Duration(minutes: 1),
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
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    return dio;
  }
}
