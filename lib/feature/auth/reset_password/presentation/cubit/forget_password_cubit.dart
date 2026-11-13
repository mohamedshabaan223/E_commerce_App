import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/auth_remote_data_source.dart';
import 'forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());

    final result = await remoteDataSource.forgetPassword(email: email);

    result.fold(
      (failure) {
        emit(ForgotPasswordError(failure.message));
      },
      (response) {
        emit(ForgotPasswordSuccess());
      },
    );
  }
}
