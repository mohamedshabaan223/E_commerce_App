// feature/product_details/presentation/viewmodels/cubits/reviews_state.dart
import 'package:ecommerce_app/feature/product_details/data/models/review_model.dart';

enum SubmitStatus { idle, loading, success, failure }

class ReviewsState {
  const ReviewsState({
    this.reviews = const [],
    this.isLoading = false,
    this.error,
    this.submitStatus = SubmitStatus.idle,
    this.submitError,
  });

  final List<ReviewModel> reviews;
  final bool isLoading;
  final String? error;
  final SubmitStatus submitStatus;
  final String? submitError;

  ReviewsState copyWith({
    List<ReviewModel>? reviews,
    bool? isLoading,
    String? error,
    bool clearError = false,
    SubmitStatus? submitStatus,
    String? submitError,
  }) {
    return ReviewsState(
      reviews: reviews ?? this.reviews,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      submitStatus: submitStatus ?? this.submitStatus,
      submitError: submitError,
    );
  }
}
