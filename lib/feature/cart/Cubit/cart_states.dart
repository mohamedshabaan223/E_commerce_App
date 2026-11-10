abstract class CartState {}

class CartInitialState extends CartState {}

class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {}

class AddToCartFailureState extends CartState {
  final String errorMessage;

  AddToCartFailureState(this.errorMessage);
}

class GetCartLoadingState extends CartState {}

class GetCartSuccessState extends CartState {
  final dynamic cartItems;

  GetCartSuccessState(this.cartItems);
}

class GetCartFailureState extends CartState {
  final String errorMessage;

  GetCartFailureState(this.errorMessage);
}

class DecCartItemLoadingState extends CartState {}

class DecCartItemSuccessState extends CartState {}

class DecCartItemFailureState extends CartState {
  final String errorMessage;

  DecCartItemFailureState(this.errorMessage);
}
