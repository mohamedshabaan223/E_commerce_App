import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:ecommerce_app/feature/profile/presentation/cubits/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._remoteDataSource) : super(ProfileInitial());

  final ProfileRemoteDataSource _remoteDataSource;

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = await _remoteDataSource.getCurrentUser();
      if (isClosed) return;
      emit(ProfileSuccess(user: user));
    } on Exception catch (error) {
      if (isClosed) return;
      emit(ProfileFailure(message: ErrorHandler.handle(error).failure.message));
    }
  }
}
