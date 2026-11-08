import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_remote.dart';
import 'auth_state.dart';

class AuthCubit2 extends Cubit<AuthState> {
  final AuthRemote authRemote = AuthRemote();

  AuthCubit2() : super(AuthInitial());

  String getErrorMessage(DioException e) {
    final data = e.response?.data;

    if (data is Map) {
      return data['message']?.toString() ??
          data['title']?.toString() ??
          'Something went wrong';
    }

    return e.message ?? 'Something went wrong';
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await authRemote.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      emit(AuthSuccess('Registration successful'));
    } on DioException catch (e) {
      emit(AuthFailure(getErrorMessage(e)));
    } catch (_) {
      emit(AuthFailure('Something went wrong'));
    }
  }

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(AuthLoading());

    try {
      await authRemote.verifyEmail(email: email, otp: otp);

      emit(AuthSuccess('Email verified successfully'));
    } on DioException catch (e) {
      emit(AuthFailure(getErrorMessage(e)));
    } catch (_) {
      emit(AuthFailure('Something went wrong'));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(AuthLoading());

    try {
      await authRemote.resendOtp(email: email);

      emit(AuthSuccess('A new code has been sent'));
    } on DioException catch (e) {
      emit(AuthFailure(getErrorMessage(e)));
    } catch (_) {
      emit(AuthFailure('Something went wrong'));
    }
  }
}
