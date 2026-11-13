// feature/product_details/presentation/widgets/reviews_section.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/product_details_cubit.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/reviews_cubit.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/reviews_state.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/add_review_sheet.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/review_tile.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/reviews_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.productId,
    required this.rating,
    required this.reviewsCount,
  });

  final String productId;
  final double rating;
  final int reviewsCount;

  void _openAddReviewSheet(BuildContext context) {
    final reviewsCubit = context.read<ReviewsCubit>()..resetSubmit();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: context.appColors.modalBackdrop,
      isScrollControlled: true,
      builder: (sheetContext) => BlocProvider.value(
        value: reviewsCubit,
        child: BlocConsumer<ReviewsCubit, ReviewsState>(
          listenWhen: (prev, curr) => prev.submitStatus != curr.submitStatus,
          listener: (_, state) {
            final messenger = ScaffoldMessenger.of(context);
            if (state.submitStatus == SubmitStatus.success) {
              Navigator.of(sheetContext).pop();
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('Review added successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              // refresh the average rating / reviews count shown above
              context.read<ProductDetailsCubit>().refresh(productId);
            } else if (state.submitStatus == SubmitStatus.failure) {
              messenger.showSnackBar(
                SnackBar(
                  content: Text(state.submitError ?? 'Something went wrong'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (_, state) => AddReviewSheet(
            isLoading: state.submitStatus == SubmitStatus.loading,
            onSubmit: (rating, comment) =>
                reviewsCubit.addReview(rating: rating, comment: comment),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewsHeader(
          rating: rating,
          reviewsCount: reviewsCount,
          onWriteReview: () => _openAddReviewSheet(context),
        ),
        SizedBox(height: 12.h),
        BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            if (state.isLoading && state.reviews.isEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.appColors.primaryColor,
                  ),
                ),
              );
            }
            if (state.error != null && state.reviews.isEmpty) {
              return _Message(
                text: state.error!,
                actionLabel: 'Retry',
                onAction: () => context.read<ReviewsCubit>().getReviews(),
              );
            }
            if (state.reviews.isEmpty) {
              return const _Message(
                text: 'No reviews yet. Be the first to write one!',
              );
            }
            return Column(
              children: [
                for (final review in state.reviews) ...[
                  ReviewTile(review: review),
                  SizedBox(height: 10.h),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.text, this.actionLabel, this.onAction});

  final String text;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.appColors.border),
      ),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyle.text14Regular.copyWith(
              color: context.appColors.textSecondary,
            ),
          ),
          if (onAction != null) ...[
            SizedBox(height: 8.h),
            TextButton(onPressed: onAction, child: Text(actionLabel ?? '')),
          ],
        ],
      ),
    );
  }
}
