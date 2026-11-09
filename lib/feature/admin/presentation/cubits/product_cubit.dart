import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this._remoteDataSource) : super(ProductInitial());

  final HomeRemoteDataSource _remoteDataSource;

  Future<void> addProduct(ProductModel product) async {
    emit(AddProductLoading());
    try {
      await _remoteDataSource.addProduct(product);
      emit(AddProductSuccess());
    } on Exception catch (error) {
      final failure = ErrorHandler.handle(error).failure;
      emit(AddProductFailure(errorMessage: failure.message));
    }
  }

  Future<void> deleteProduct(String productId) async {
    emit(DeleteProductLoading());
    try {
      await _remoteDataSource.deleteProduct(productId);
      emit(DeleteProductSuccess(deletedProductId: productId));
    } on Exception catch (error) {
      final failure = ErrorHandler.handle(error).failure;
      emit(DeleteProductFailure(errorMessage: failure.message));
    }
  }
}
