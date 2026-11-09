import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';

class AdminRemoteDataSource {
  final Dio dio = DioFactory().dio;

  Future<void> addProduct(ProductModel product) async {
    await dio.post(ApiConstatnt.addProductEndPoint, data: product.toJson());
  }

  Future<void> deleteProduct(String productId) async {
    await dio.delete('${ApiConstatnt.deleteProductEndPoint}$productId');
  }
}
