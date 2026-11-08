import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/auth/data/models/login_request.dart';

class AuthRemoteDataSource {
  final Dio dio = DioFactory().dio;
  final SecureStorageCacheing secureStorageCacheing = SecureStorageCacheing();

  Future<Either<Failure, void>> signIn({required LoginRequest request}) async {
    try {
      final Response response = await dio.post(
        ApiConstatnt.signInEndPoint,
        data: request.toJson(),
      );
      await secureStorageCacheing.saveAuthData(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
        expiresAt: DateTime.parse(response.data['expiresAtUtc']),
      );
      return  Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}