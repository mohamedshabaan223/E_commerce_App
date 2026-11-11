import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/remote/admin_remote_data_source.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this._remoteDataSource) : super(ProductInitial());

  final AdminRemoteDataSource _remoteDataSource;

  Future<String> addProduct(ProductModel product) async {
    emit(AddProductLoading());

    try {
      final productId = await _remoteDataSource.addProduct(product);
      emit(AddProductSuccess(productId: productId));
      return productId;
    } on Exception catch (error) {
      final failure = ErrorHandler.handle(error).failure;
      emit(AddProductFailure(errorMessage: failure.message));
      return '';
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

  Future<void> loadSellerId() async {
    try {
      final sellerId = await _remoteDataSource.getCurrentUserId();
      emit(SellerIdLoaded(sellerId: sellerId));
    } on Exception catch (_) {
      // If it fails, the field stays manual.
    }
  }
}
