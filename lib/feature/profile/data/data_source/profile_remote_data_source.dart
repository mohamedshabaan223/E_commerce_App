import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/profile/data/models/user_model.dart';

class ProfileRemoteDataSource {
  final Dio _dio = DioFactory().dio;

  Future<UserModel> getCurrentUser() async {
    final res = await _dio.get('auth/me');
    return UserModel.fromJson(Map<String, dynamic>.from(res.data));
  }
}
