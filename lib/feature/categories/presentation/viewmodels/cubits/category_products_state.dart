import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsSuccess extends CategoryProductsState {
  CategoryProductsSuccess(
    this.products, {
    this.hasNextPage = false,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  final List<ProductModel> products;
  final bool hasNextPage;
  final bool isLoadingMore;
  final String? loadMoreError;
}

class CategoryProductsFailure extends CategoryProductsState {
  CategoryProductsFailure(this.message);

  final String message;
}
