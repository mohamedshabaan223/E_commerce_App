import 'package:ecommerce_app/feature/home/data/models/product_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  SearchSuccess(this.products);

  final List<ProductModel> products;
}

class SearchFailure extends SearchState {
  SearchFailure(this.message);

  final String message;
}
