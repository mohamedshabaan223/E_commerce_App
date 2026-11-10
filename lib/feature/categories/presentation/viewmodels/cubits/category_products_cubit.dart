// feature/categories/presentation/viewmodels/cubits/category_products_cubit.dart
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/categories/data/repo/categories_repo.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/category_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this._repo) : super(CategoryProductsInitial());

  final CategoriesRepo _repo;

  Future<void> load(String category) async {
    emit(CategoryProductsLoading());
    try {
      final products = await _repo.getProductsByCategory(category);
      if (isClosed) return;
      emit(CategoryProductsSuccess(products));
    } catch (e) {
      if (isClosed) return;
      emit(
        CategoryProductsFailure(
          e is ErrorHandler ? e.failure.message : e.toString(),
        ),
      );
    }
  }
}