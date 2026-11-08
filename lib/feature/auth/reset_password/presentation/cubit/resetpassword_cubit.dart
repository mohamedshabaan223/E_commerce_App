import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/auth_remote_data_source.dart';
import 'resetpassword_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());

    final result = await remoteDataSource.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );

    result.fold(
      (failure) {
        emit(ResetPasswordError(failure.message));
      },
      (response) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
