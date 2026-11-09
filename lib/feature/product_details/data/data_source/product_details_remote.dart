import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/product_details/data/models/product_details_model.dart';

class ProductDetailsRemoteDataSource {
  final Dio _dio = DioFactory().dio;

  Future<ProductDetailsModel> getProductById(String id) async {
    final res = await _dio.get('products/$id');
    return ProductDetailsModel.fromJson(res.data);
  }
}
