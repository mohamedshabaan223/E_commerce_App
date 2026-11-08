import 'package:dio/dio.dart';

import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

class HomeRemoteDataSource {
  final Dio dio = DioFactory().dio;

  Future<void> addProduct(ProductModel product) async {
    await dio.post(ApiConstatnt.getProductEndPoint, data: product.toJson());
  }

  Future<void> deleteProduct(String productId) async {
    await dio.delete('${ApiConstatnt.deleteProductEndPoint}$productId');
  }
}
