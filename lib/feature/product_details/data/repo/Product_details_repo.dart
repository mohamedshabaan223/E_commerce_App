import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/product_details/data/models/product_details_model.dart';
import 'package:ecommerce_app/feature/product_details/data/data_source/Product_details_remote.dart';

class ProductDetailsRepo {
  ProductDetailsRepo({ProductDetailsRemoteDataSource? remote})
    : _remote = remote ?? ProductDetailsRemoteDataSource();

  final ProductDetailsRemoteDataSource _remote;

  Future<ProductDetailsModel> getProductById(String id) async {
    try {
      return await _remote.getProductById(id);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
