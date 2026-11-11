import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';

class AdminRemoteDataSource {
  final Dio dio = DioFactory().dio;

  Future<String> addProduct(ProductModel product) async {
    final res = await dio.post(
      ApiConstatnt.addProductEndPoint,
      data: product.toJson(),
    );
    return res.data['id'].toString();
  }

  Future<void> deleteProduct(String productId) async {
    await dio.delete('${ApiConstatnt.deleteProductEndPoint}$productId');
  }

  Future<String> getCurrentUserId() async {
    final res = await dio.get('auth/me');
    return res.data['userId'].toString();
  }
}
