// feature/product_details/presentation/viewmodels/cubits/reviews_cubit.dart
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/reviews_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._repo, this.productId) : super(const ReviewsState());

  final ProductDetailsRepo _repo;
  final String productId;

  String _message(Object e) =>
      e is ErrorHandler ? e.failure.message : e.toString();

  Future<void> getReviews() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final reviews = await _repo.getReviews(productId);
      if (isClosed) return;
      emit(state.copyWith(reviews: reviews, isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, error: _message(e)));
    }
  }

  Future<void> addReview({required int rating, required String comment}) async {
    if (state.submitStatus == SubmitStatus.loading) return;
    emit(state.copyWith(submitStatus: SubmitStatus.loading));
    try {
      await _repo.addReview(
        productId: productId,
        rating: rating,
        comment: comment.trim(),
      );
      if (isClosed) return;
      emit(state.copyWith(submitStatus: SubmitStatus.success));
      await getReviews();
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          submitStatus: SubmitStatus.failure,
          submitError: _message(e),
        ),
      );
    }
  }

  void resetSubmit() => emit(state.copyWith(submitStatus: SubmitStatus.idle));
}
