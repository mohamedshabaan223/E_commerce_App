abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class AddProductLoading extends ProductStates {}

class AddProductSuccess extends ProductStates {}

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
