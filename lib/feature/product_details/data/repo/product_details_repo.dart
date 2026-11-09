import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/product_details/data/models/product_details_model.dart';
import 'package:ecommerce_app/feature/product_details/data/data_source/product_details_remote.dart';
import 'package:ecommerce_app/feature/product_details/data/models/review_model.dart';

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

  Future<List<ReviewModel>> getReviews(String productId) async {
    try {
      return await _remote.getReviews(productId);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> addReview({
    required String productId,
    required int rating,
    required String comment,
  }) async {
    try {
      await _remote.addReview(
        productId: productId,
        rating: rating,
        comment: comment,
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
