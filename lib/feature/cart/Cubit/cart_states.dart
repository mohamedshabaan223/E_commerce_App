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
