import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/categories/data/data_source/categories_remote.dart';
import 'package:ecommerce_app/feature/categories/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

class CategoriesRepo {
  CategoriesRepo({CategoriesRemoteDataSource? remote})
    : _remote = remote ?? CategoriesRemoteDataSource();

  final CategoriesRemoteDataSource _remote;

  Future<List<CategoryModel>> getCategories() async {
    try {
      return await _remote.getCategories();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      return await _remote.getProductsByCategory(category);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
