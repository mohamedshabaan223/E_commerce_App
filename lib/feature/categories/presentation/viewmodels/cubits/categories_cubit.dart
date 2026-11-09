import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/categories/data/repo/categories_repo.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repo) : super(CategoriesInitial());

  final CategoriesRepo _repo;

  Future<void> load() async {
    emit(CategoriesLoading());
    try {
      final categories = await _repo.getCategories();
      if (isClosed) return;
      emit(CategoriesSuccess(categories));
    } catch (e) {
      if (isClosed) return;
      emit(
        CategoriesFailure(e is ErrorHandler ? e.failure.message : e.toString()),
      );
    }
  }
}
