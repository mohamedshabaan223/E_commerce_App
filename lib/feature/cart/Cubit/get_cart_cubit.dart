import 'package:bloc/bloc.dart';

import '../../../core/errors/failure.dart';
import '../data/remote_data_sources/cart_remote_data_source.dart';
import 'cart_states.dart';

class GetCartCubit extends Cubit<CartState> {
  final CartRemoteDataSource dataSource;

  GetCartCubit(this.dataSource) : super(CartInitialState());

  dynamic cartItems;
  int get cartCount {
    final items = cartItems is Map ? cartItems['cartItems'] : null;

    if (items is! List) return 0;

    return items.fold<int>(0, (total, item) {
      final quantity = item is Map ? item['quantity'] : null;

      return total + (quantity is num ? quantity.toInt() : 0);
    });
  }

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
}
