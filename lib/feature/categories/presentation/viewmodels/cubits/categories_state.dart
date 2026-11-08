import 'package:ecommerce_app/feature/categories/data/models/category_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  CategoriesSuccess(this.categories);

  final List<CategoryModel> categories;
}

class CategoriesFailure extends CategoriesState {
  CategoriesFailure(this.message);

  final String message;
}
