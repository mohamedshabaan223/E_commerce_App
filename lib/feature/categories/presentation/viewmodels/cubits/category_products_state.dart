import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsSuccess extends CategoryProductsState {
  CategoryProductsSuccess(this.products);

  final List<ProductModel> products;
}

class CategoryProductsFailure extends CategoryProductsState {
  CategoryProductsFailure(this.message);

  final String message;
}