import 'package:ecommerce_app/feature/home/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/data/models/offer_model.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  HomeSuccess({
    required this.offers,
    required this.categories,
    required this.products,
    this.offersError,
    this.categoriesError,
    this.productsError,
  });

  final List<OfferModel> offers;
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  final String? offersError;
  final String? categoriesError;
  final String? productsError;

  List<ProductModel> get hotDeals =>
      products.where((p) => p.discountPercentage > 0).toList();
}

class HomeFailure extends HomeState {
  HomeFailure(this.message);

  final String message;
}
