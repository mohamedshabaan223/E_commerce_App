// feature/product_details/data/data_source/product_details_remote.dart
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
    final raw = _extractList(res.data);
    return raw
        .whereType<Map>()
        .map((e) => ReviewModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  List _extractList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
    
      for (final key in ['items', 'reviews', 'data', 'result', 'results']) {
        final v = data[key];
        if (v is List) return v;
        if (v is Map) {
        
          final nested = _extractList(v);
          if (nested.isNotEmpty) return nested;
        }
      }
      
      if (data.containsKey('product') && data['product'] is Map) {
        final nested = _extractList(data['product']);
        if (nested.isNotEmpty) return nested;
      }
    }
    return const [];
  }

  Future<void> addReview({
    required String productId,
    required int rating,
    required String comment,
  }) async {
    await _dio.post(
      ApiConstatnt.productReviewsEndPoint(productId),
      data: {
        'productId': productId,
        'rating': rating,
        'comment': comment,
      },
    );
  }
}