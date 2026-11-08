// // import 'dart:developer';
// //
// // import 'package:dio/dio.dart';
// // import 'package:ecommerce_app/core/network/dio_factory.dart';
// //
// // class AuthRemoteDataSource {
// //   final Dio dio = DioFactory().dio;
// //   Future<void> forgetPassword({required String email}) async {
// //     try {
// //       final Response response = await dio.post(
// //         "auth/forgot-password",
// //         data: {"email": email},
// //       );
// //       log('STATUS: ${response.statusCode}');
// //       log('DATA: ${response.data}');
// //       return response.data;
// //     } on DioException catch (e) {
// //       log('Forgot Password Error: ${e.response?.data}');
// //     }
// //   }
// //
// //   Future<Response> verifyOtp({
// //     required String email,
// //     required String otp,
// //   }) async {
// //     return await dio.post(
// //       "auth/validate-otp",
// //       data: {'email': email, 'otp': otp},
// //     );
// //   }
// //
// //   Future<Response> resetPassword({
// //     required String email,
// //     required String otp,
// //     required String newPassword,
// //   }) async {
// //     final response = await DioFactory().dio.post(
// //       'auth/reset-password',
// //       data: {"email": email, "otp": otp, "newPassword": newPassword},
// //     );
// //
// //     return response;
// //   }
// // }
//
// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:ecommerce_app/core/errors/error_handler.dart';
// import 'package:ecommerce_app/core/network/dio_factory.dart';
//
// class AuthRemoteDataSource {
//   final Dio dio = DioFactory().dio;
//
//   // Forgot Password
//   Future<void> forgetPassword({required String email}) async {
//     try {
//       final response = await dio.post(
//         "auth/forgot-password",
//         data: {"email": email},
//       );
//     } on DioException catch (e) {
//       throw ErrorHandler.handle(e);
//     }
//   }
//
//   // Verify OTP
//   Future<Response> verifyOtp({
//     required String email,
//     required String otp,
//   }) async {
//     try {
//       final response = await dio.post(
//         "auth/validate-otp",
//         data: {'email': email, 'otp': otp},
//       );
//
//       return response;
//     } on DioException catch (e) {
//       log('Verify OTP Error: ${e.response?.data}');
//       throw ErrorHandler.handle(e);
//     }
//   }
//
//   // Reset Password
//   Future<Response> resetPassword({
//     required String email,
//     required String otp,
//     required String newPassword,
//   }) async {
//     try {
//       final response = await dio.post(
//         'auth/reset-password',
//         data: {"email": email, "otp": otp, "newPassword": newPassword},
//       );
//
//       return response;
//     } on DioException catch (e) {
//       log('Reset Password Error: ${e.response?.data}');
//       throw ErrorHandler.handle(e);
//     }
//   }
// }

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';

class AuthRemoteDataSource {
  final Dio dio = DioFactory().dio;

  // Forgot Password
  Future<Either<Failure, Response>> forgetPassword({
    required String email,
  }) async {
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

  // Verify OTP
  Future<Either<Failure, Response>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dio.post(
        "auth/validate-otp",
        data: {"email": email, "otp": otp},
      );

      log('OTP STATUS: ${response.statusCode}');
      log('OTP RESPONSE: ${response.data}');

      return Right(response);
    } catch (e) {
      log('Verify OTP Error: $e');
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  // Reset Password
  Future<Either<Failure, Response>> resetPassword({
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
}
