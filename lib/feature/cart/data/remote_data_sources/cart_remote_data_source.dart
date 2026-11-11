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
      await dio.post(ApiConstatnt.addToCartEndPoint, data: data);
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<void> decrementCartItem({
    required String itemId,
    required int quantity,
  }) async {
    try {
      await dio.post(
        ApiConstatnt.decrementCartItemEndPoint,
        data: {'itemId': itemId, 'quantity': quantity},
      );
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<void> deleteCartItem(String itemId) async {
    try {
      await dio.delete(
        ApiConstatnt.deleteCartItemEndPoint(itemId),
        data: {'id': itemId},
      );
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<dynamic> applyCoupon(String couponCode) async {
    try {
      final response = await dio.post(
        ApiConstatnt.applyCouponEndPoint,
        data: {'couponCode': couponCode},
      );
      return response.data;
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}
