import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote_data_source/auth_remote_data_source.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();

  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(OtpLoading());

    final result = await remoteDataSource.verifyOtp(email: email, otp: otp);

    result.fold(
      (failure) {
        emit(OtpError(failure.message));
      },
      (response) {
        emit(OtpSuccess());
      },
    );
  }
}
