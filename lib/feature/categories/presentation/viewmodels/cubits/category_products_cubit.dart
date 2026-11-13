import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/categories/data/repo/categories_repo.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/category_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this._repo) : super(CategoryProductsInitial());

  final CategoriesRepo _repo;
  String? _category;
  int _currentPage = 1;
  bool _hasNextPage = false;
  bool _isLoadingMore = false;

  Future<void> load(String category) async {
    emit(CategoryProductsLoading());
    _category = category;
    _currentPage = 1;
    _hasNextPage = false;
    try {
      final result = await _repo.getProductsByCategory(category, page: 1);
      if (isClosed) return;
      _hasNextPage = result.hasNextPage;

      emit(CategoryProductsSuccess(result.products, hasNextPage: _hasNextPage));
    } catch (e) {
      if (isClosed) return;
      emit(
        CategoryProductsFailure(
          e is ErrorHandler ? e.failure.message : e.toString(),
        ),
      );
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasNextPage || _category == null) return;

    final currentState = state;
    if (currentState is! CategoryProductsSuccess) return;

    _isLoadingMore = true;

    emit(
      CategoryProductsSuccess(
        currentState.products,
        hasNextPage: _hasNextPage,
        isLoadingMore: true,
      ),
    );

    try {
      final nextPage = _currentPage + 1;

      final result = await _repo.getProductsByCategory(
        _category!,
        page: nextPage,
      );

      if (isClosed) return;

      _currentPage = nextPage;
      _hasNextPage = result.hasNextPage;

      emit(
        CategoryProductsSuccess([
          ...currentState.products,
          ...result.products,
        ], hasNextPage: _hasNextPage),
      );
    } catch (e) {
      if (isClosed) return;

      emit(
        CategoryProductsSuccess(
          currentState.products,
          hasNextPage: _hasNextPage,
          loadMoreError: e is ErrorHandler ? e.failure.message : e.toString(),
        ),
      );
    } finally {
      _isLoadingMore = false;
    }
  }
}
