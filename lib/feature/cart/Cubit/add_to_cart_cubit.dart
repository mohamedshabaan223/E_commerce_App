import 'package:bloc/bloc.dart';
import '../../../core/errors/failure.dart';
import '../data/remote_data_sources/cart_remote_data_source.dart';
import 'cart_states.dart';

class AddToCartCubit extends Cubit<CartState> {
  final CartRemoteDataSource dataSource;

  AddToCartCubit(this.dataSource) : super(CartInitialState());

  Future<void> addToCart({required String productId ,required int quantity}) async {
    emit(AddToCartLoadingState());
    try {
      final Map<String, dynamic> data = {'productId': productId, 'quantity': quantity};
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
