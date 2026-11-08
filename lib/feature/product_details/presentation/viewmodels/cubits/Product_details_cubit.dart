import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/Product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._repo) : super(ProductDetailsInitial());

  final ProductDetailsRepo _repo;

  Future<void> load(String id) async {
    emit(ProductDetailsLoading());
    try {
      final product = await _repo.getProductById(id);
      if (isClosed) return;
      emit(ProductDetailsSuccess(product));
    } catch (e) {
      if (isClosed) return;
      emit(
        ProductDetailsFailure(
          e is ErrorHandler ? e.failure.message : e.toString(),
        ),
      );
    }
  }
}
