import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';

abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class AddProductLoading extends ProductStates {}

class AddProductSuccess extends ProductStates {
  final String productId;

  AddProductSuccess({required this.productId});
}

class AddProductFailure extends ProductStates {
  final String errorMessage;

  AddProductFailure({required this.errorMessage});
}

class DeleteProductLoading extends ProductStates {}

class DeleteProductSuccess extends ProductStates {
  final String deletedProductId;

  DeleteProductSuccess({required this.deletedProductId});
}

class DeleteProductFailure extends ProductStates {
  final String errorMessage;

  DeleteProductFailure({required this.errorMessage});
}

class SellerIdLoaded extends ProductStates {
  final String sellerId;

  SellerIdLoaded({required this.sellerId});
}

class SellerIdFailure extends ProductStates {
  final String failureMessage;

  SellerIdFailure({required this.failureMessage});
}

class MyProductsLoaded extends ProductStates {
  final List<ProductModel> products;

  MyProductsLoaded({required this.products});
}
