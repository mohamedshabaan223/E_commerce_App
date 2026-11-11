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

class DeleteCartItemLoadingState extends CartState {}

class DeleteCartItemSuccessState extends CartState {}

class DeleteCartItemFailureState extends CartState {
  final String errorMessage;
  DeleteCartItemFailureState(this.errorMessage);
}

class ApplyCouponLoadingState extends CartState {}

class ApplyCouponSuccessState extends CartState {
  final dynamic couponData;
  ApplyCouponSuccessState(this.couponData);
}

class ApplyCouponFailureState extends CartState {
  final String errorMessage;
  ApplyCouponFailureState(this.errorMessage);
}
