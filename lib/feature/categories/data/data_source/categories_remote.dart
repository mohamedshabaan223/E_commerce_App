import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/categories/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

class CategoriesRemoteDataSource {
  final Dio _dio = DioFactory().dio;

  Future<List<CategoryModel>> getCategories() async {
    final res = await _dio.get('categories');
    final data = res.data;
    final items = <dynamic>[];
    if (data is List) {
      for (final e in data) {
        if (e is Map && e['categories'] is List) {
          items.addAll(e['categories']);
        } else {
          items.add(e);
        }
      }
    } else if (data is Map && data['categories'] is List) {
      items.addAll(data['categories']);
    }
    final validItems = items.where((e) {
      final name = e['name']?.toString().trim().toLowerCase();
      final image = e['coverPictureUrl']?.toString().trim().toLowerCase();

      return name != null &&
          name.isNotEmpty &&
          name != 'string' &&
          name != 'istring' &&
          image != 'string';
    }).toList();

    return validItems.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final res = await _dio.get(
      'products',
      queryParameters: {'category': category, 'page': 1, 'pageSize': 20},
    );
    final items = res.data['items'] as List;
    return items.map((e) => ProductModel.fromJson(e)).toList();
  }
}
