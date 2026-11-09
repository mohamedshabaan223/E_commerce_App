import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/home/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/data/models/offer_model.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';
import 'package:ecommerce_app/feature/home/data/repo/home_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/viewmodels/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());

  final HomeRepo _repo;

  Future<void> load() async {
    emit(HomeLoading());

    var offers = <OfferModel>[];
    var categories = <CategoryModel>[];
    var products = <ProductModel>[];
    String? offersError;
    String? categoriesError;
    String? productsError;

    Future<void> fetchOffers() async {
      try {
        offers = await _repo.getOffers();
      } catch (e) {
        offersError = _message(e);
      }
    }

    Future<void> fetchCategories() async {
      try {
        categories = await _repo.getCategories();
      } catch (e) {
        categoriesError = _message(e);
      }
    }

    Future<void> fetchProducts() async {
      try {
        products = await _repo.getProducts();
      } catch (e) {
        productsError = _message(e);
      }
    }

    await Future.wait([fetchOffers(), fetchCategories(), fetchProducts()]);

    if (isClosed) return;

    if (offersError != null &&
        categoriesError != null &&
        productsError != null) {
      emit(HomeFailure(productsError!));
      return;
    }

    emit(
      HomeSuccess(
        offers: offers,
        categories: categories,
        products: products,
        offersError: offersError,
        categoriesError: categoriesError,
        productsError: productsError,
      ),
    );
  }

  String _message(Object e) =>
      e is ErrorHandler ? e.failure.message : e.toString();
}
