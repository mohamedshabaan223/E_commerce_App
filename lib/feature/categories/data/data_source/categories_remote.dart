import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/categories/data/models/category_model.dart';

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
    return items.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
