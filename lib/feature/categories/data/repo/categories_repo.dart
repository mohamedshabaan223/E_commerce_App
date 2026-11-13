import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/categories/data/data_source/categories_remote.dart';
import 'package:ecommerce_app/feature/categories/data/models/category_model.dart';

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

  Future<CategoryProductsPage> getProductsByCategory(
    String category, {
    int page = 1,
  }) async {
    try {
      return await _remote.getProductsByCategory(category, page: page);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
