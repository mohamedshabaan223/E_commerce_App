import 'package:dio/dio.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/network/api_constatnt.dart';

class CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSource(this.dio);

  Future<dynamic> getCart() async {
    try {
      final response = await dio.get(ApiConstatnt.getCartEndPoint);
      return response.data;
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<void> addToCart(Map<String, dynamic> data) async {
    try {
      await dio.post(
        ApiConstatnt.addToCartEndPoint,
        data: data,
      );
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}