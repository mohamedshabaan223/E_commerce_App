import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/auth/data/models/login_request.dart';
import 'package:ecommerce_app/feature/auth/data/models/register_request.dart';

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
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, void>> signUp({
    required RegisterRequest request,
  }) async {
    try {
      await dio.post(ApiConstatnt.signUpEndPoint, data: request.toJson());
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final Response response = await dio.post(
        ApiConstatnt.changePasswordEndPoint,
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword,
        },
      );
      log(response.data);
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      final response = await dio.post(
        "auth/forgot-password",
        data: {"email": email},
      );

      return Right(response);
    } catch (e) {
      log('Forgot Password Error: $e');
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dio.post(
        ApiConstatnt.verifiyEmailEndPoint,
        data: {"email": email, "otp": otp},
      );

      return Right(response);
    } catch (e) {
      log('Verify OTP Error: $e');
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  // Reset Password
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final response = await dio.post(
        "auth/reset-password",
        data: {"email": email, "otp": otp, "newPassword": newPassword},
      );

      return Right(response);
    } catch (e) {
      log('Reset Password Error: $e');
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<void> resendOtp({required String email}) async {
    await dio.post('auth/resend-otp', data: {'email': email});
  }

  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dio.post(
        ApiConstatnt.verifiyEmailEndPoint,
        data: {"email": email, "otp": otp},
      );

      log('Verify Email Success: ${response.data}');
      return Right(response);
    } catch (e) {
      log('Verify Email Error: $e');
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
