import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/search/data/repo/search_repo.dart';
import 'package:ecommerce_app/feature/search/presentation/viewmodels/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._repo) : super(SearchInitial());

  final SearchRepo _repo;

  Future<void> search(String term) async {
    emit(SearchLoading());
    try {
      final products = await _repo.search(term.trim());
      if (isClosed) return;
      emit(SearchSuccess(products));
    } catch (e) {
      if (isClosed) return;
      emit(SearchFailure(e is ErrorHandler ? e.failure.message : e.toString()));
    }
  }
}
