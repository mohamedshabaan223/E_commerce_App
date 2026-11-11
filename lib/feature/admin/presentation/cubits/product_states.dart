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
