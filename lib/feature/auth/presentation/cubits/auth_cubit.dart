import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/feature/auth/data/models/login_request.dart';
import 'package:ecommerce_app/feature/auth/data/models/register_request.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();

  Future<void> signIn(LoginRequest request) async {
    emit(AuthLoadingState());
    final response = await _authRemoteDataSource.signIn(request: request);
    response.fold(
      (error) => emit(AuthErrorState(errorMessage: error.message)),
      (value) => emit(AuthSuccessState()),
    );
  }

  Future<void> signUp(RegisterRequest request) async {
    emit(AuthLoadingState());
    final response = await _authRemoteDataSource.signUp(request: request);
    response.fold(
      (error) => emit(AuthErrorState(errorMessage: error.message)),
      (value) => emit(AuthSuccessState()),
    );
  }

  Future<void> resendOtp({required String email}) async {
    emit(AuthLoadingState());
    final response = await _authRemoteDataSource.resendOtp(email: email);
    response.fold(
      (error) => emit(AuthErrorState(errorMessage: error.message)),
      (value) => emit(AuthSuccessState()),
    );
  }

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(AuthLoadingState());

    final response = await _authRemoteDataSource.verifyEmail(
      email: email,
      otp: otp,
    );

    response.fold(
      (error) {
        emit(AuthErrorState(errorMessage: error.message));
      },
      (value) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> changPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(AuthLoadingState());
    final response = await _authRemoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );
    response.fold(
      (error) => emit(AuthErrorState(errorMessage: error.message)),
      (value) => emit(AuthSuccessState()),
    );
  }

  Future<void> logOut() async {
    emit(AuthLoadingState());
    final response = await _authRemoteDataSource.logOut();
    response.fold(
      (error) => emit(AuthErrorState(errorMessage: error.message)),
      (val) => emit(AuthSuccessState()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoadingState());
    final response = await _authRemoteDataSource.signInWithGoogle();
    response.fold((error) {
      if (error.code == ResponseCode.cancel) {
        emit(AuthInitialState());
        return;
      }
      emit(AuthErrorState(errorMessage: error.message));
    }, (_) => emit(AuthSuccessState()));
  }
}
