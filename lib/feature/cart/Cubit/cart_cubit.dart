import 'package:ecommerce_app/feature/cart/Cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/errors/failure.dart';
import '../data/remote_data_sources/cart_remote_data_source.dart';


class CartCubit extends Cubit<CartState> {
  final CartRemoteDataSource dataSource;

  CartCubit(this.dataSource) : super(CartInitialState());

  dynamic cartItems;

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    try {
      final response = await dataSource.getCart();
      cartItems = response;
      emit(GetCartSuccessState(cartItems));
    } catch (e) {
      if (e is Failure) {
        emit(GetCartFailureState(e.message));
      } else {
        emit(GetCartFailureState(e.toString()));
      }
    }
  }

  Future<void> addToCart({required int productId}) async {
    emit(AddToCartLoadingState());
    try {
      final Map<String, dynamic> data = {
        'productId': productId,
        'quantity': 1,
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
}