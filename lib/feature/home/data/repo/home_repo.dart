import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce_app/feature/home/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/data/models/offer_model.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';
import 'package:flutter/foundation.dart';

class HomeRepo {
  HomeRepo({HomeRemoteDataSource? remote})
    : _remote = remote ?? HomeRemoteDataSource();

  final HomeRemoteDataSource _remote;

  Future<List<OfferModel>> getOffers() => _guard(_remote.getOffers);
  Future<List<CategoryModel>> getCategories() => _guard(_remote.getCategories);
  Future<List<ProductModel>> getProducts() => _guard(_remote.getProducts);

  Future<T> _guard<T>(Future<T> Function() call) async {
    try {
      return await call();
    } catch (e) {
      debugPrint('HomeRepo error: $e');
      throw ErrorHandler.handle(e);
    }
  }
}
