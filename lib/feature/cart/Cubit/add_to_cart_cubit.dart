import 'package:bloc/bloc.dart';

import '../../../core/errors/failure.dart';
import '../data/remote_data_sources/cart_remote_data_source.dart';
import 'cart_states.dart';

class AddToCartCubit extends Cubit<CartState> {
  final CartRemoteDataSource dataSource;

  AddToCartCubit(this.dataSource) : super(CartInitialState());

  Future<void> addToCart({
    required String productId,
    required int quantity,
  }) async {
    emit(AddToCartLoadingState());
    try {
      final Map<String, dynamic> data = {
        'productId': productId,
        'quantity': quantity,
      };
      await dataSource.addToCart(data);
      emit(AddToCartSuccessState());
    } catch (e) {
      if (e is Failure) {
        emit(AddToCartFailureState(e.message));
      } else {
        emit(AddToCartFailureState(e.toString()));
      }
    }
  }

  Future<void> decrementCartItem({
    required String itemId,
    required int quantity,
  }) async {
    emit(DecCartItemLoadingState());
    try {
      await dataSource.decrementCartItem(itemId: itemId, quantity: quantity);
      emit(DecCartItemSuccessState());
    } catch (e) {
      if (e is Failure) {
        emit(DecCartItemFailureState(e.message));
      } else {
        emit(DecCartItemFailureState(e.toString()));
      }
    }
  }

  Future<void> deleteCartItem({required String itemId}) async {
    emit(DeleteCartItemLoadingState());
    try {
      await dataSource.deleteCartItem(itemId);
      emit(DeleteCartItemSuccessState());
    } catch (e) {
      if (e is Failure) {
        emit(DeleteCartItemFailureState(e.message));
      } else {
        emit(DeleteCartItemFailureState(e.toString()));
      }
    }
  }

  Future<void> applyCoupon({required String couponCode}) async {
    emit(ApplyCouponLoadingState());
    try {
      final response = await dataSource.applyCoupon(couponCode);
      emit(ApplyCouponSuccessState(response));
    } catch (e) {
      if (e is Failure) {
        emit(ApplyCouponFailureState(e.message));
      } else {
        emit(ApplyCouponFailureState(e.toString()));
      }
    }
  }
}
