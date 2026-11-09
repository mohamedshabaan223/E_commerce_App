import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/product_details/data/models/product_details_model.dart';
import 'package:ecommerce_app/feature/product_details/data/models/review_model.dart';

class ProductDetailsRemoteDataSource {
  final Dio _dio = DioFactory().dio;

  Future<ProductDetailsModel> getProductById(String id) async {
    final res = await _dio.get('products/$id');
    return ProductDetailsModel.fromJson(res.data);
  }

  Future<List<ReviewModel>> getReviews(String productId) async {
    final res = await _dio.get(ApiConstatnt.productReviewsEndPoint(productId));
    final data = res.data;
    final List raw = data is List
        ? data
        : (data is Map
              ? (data['items'] ?? data['data'] ?? data['reviews'] ?? const [])
                    as List
              : const []);
    return raw
        .whereType<Map>()
        .map((e) => ReviewModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> addReview({
    required String productId,
    required int rating,
    required String comment,
  }) async {
    await _dio.post(
      ApiConstatnt.productReviewsEndPoint(productId),
      data: {'rating': rating, 'comment': comment},
    );
  }
}
