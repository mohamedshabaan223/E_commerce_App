// feature/product_details/presentation/viewmodels/cubits/product_details_state.dart
import 'package:ecommerce_app/feature/product_details/data/models/product_details_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  ProductDetailsSuccess(this.product);

  final ProductDetailsModel product;
}

class ProductDetailsFailure extends ProductDetailsState {
  ProductDetailsFailure(this.message);

  final String message;
}
