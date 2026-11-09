import 'package:dio/dio.dart';

class AuthRemote {
  final Dio dio;

  AuthRemote()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://accessories-eshop.runasp.net',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await dio.post(
      '/api/auth/register',
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      },
    );
  }

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    await dio.post(
      '/api/auth/verify-email',
      data: {
        'email': email,
        'otp': otp,
      },
    );
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    await dio.post(
      '/api/auth/resend-otp',
      data: {
        'email': email,
      },
    );
  }
}