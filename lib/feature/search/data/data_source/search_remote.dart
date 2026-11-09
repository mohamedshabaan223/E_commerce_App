import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

class SearchRemote {
  final Dio _dio = DioFactory().dio;

  Future<List<ProductModel>> search(String term) async {
    final res = await _dio.get(
      'products',
      queryParameters: {'searchTerm': term, 'page': 1, 'pageSize': 20},
    );
    final items = res.data['items'] as List;
    return items.map((e) => ProductModel.fromJson(e)).toList();
  }
}
