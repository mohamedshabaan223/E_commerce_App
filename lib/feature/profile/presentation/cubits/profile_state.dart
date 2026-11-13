import 'package:ecommerce_app/feature/profile/data/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserModel user;

  ProfileSuccess({required this.user});
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure({required this.message});
}
