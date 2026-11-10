// feature/product_details/presentation/screens/product_details_screen.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/Cubit/add_to_cart_cubit.dart';
import 'package:ecommerce_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/product_details_cubit.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/product_details_state.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/reviews_cubit.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/reviews_state.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/add_review_sheet.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/product_description_card.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/product_image_gallery.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/product_specs_card.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/product_thumbnails_row.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/product_title_price.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/quantity_selector.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/review_tile.dart';
import 'package:ecommerce_app/feature/product_details/presentation/widgets/reviews_header.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/cart/data/remote_data_sources/cart_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedImageIndex = 0;
  int _quantity = 1;

  void _openAddReviewSheet(BuildContext ctx) {
    final reviewsCubit = ctx.read<ReviewsCubit>();
    final productDetailsCubit = ctx.read<ProductDetailsCubit>();
    reviewsCubit.resetSubmit();
    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.transparent,
      barrierColor: ctx.appColors.modalBackdrop,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: reviewsCubit,
        child: BlocListener<ReviewsCubit, ReviewsState>(
          listenWhen: (prev, curr) => prev.submitStatus != curr.submitStatus,
          listener: (context, state) {
            if (state.submitStatus == SubmitStatus.success) {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(ctx).showSnackBar(
                const SnackBar(content: Text('Review added successfully')),
              );
              productDetailsCubit.refresh(widget.productId);

              reviewsCubit.resetSubmit();
            }
            if (state.submitStatus == SubmitStatus.failure) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(
                  content: Text(
                    state.submitError ?? state.error ?? 'Failed to add review',
                  ),
                ),
              );
              reviewsCubit.resetSubmit();
            }
          },
          child: BlocBuilder<ReviewsCubit, ReviewsState>(
            builder: (context, reviewsState) {
              return AddReviewSheet(
                isLoading: reviewsState.submitStatus == SubmitStatus.loading,
                onClose: () => Navigator.pop(ctx),
                onSubmit: (rating, comment) {
                  reviewsCubit.addReview(rating: rating, comment: comment);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ProductDetailsCubit(ProductDetailsRepo())..load(widget.productId),
        ),
        BlocProvider(
          create: (_) =>
              ReviewsCubit(ProductDetailsRepo(), widget.productId)
                ..getReviews(),
        ),
        BlocProvider(
          create: (_) => AddToCartCubit(CartRemoteDataSource(DioFactory().dio)),
        ),
      ],
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.appColors.backgroundColor,
            appBar: _buildAppBar(
              state is ProductDetailsSuccess ? state.product.name : '',
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      backgroundColor: context.appColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: context.appColors.primaryColor,
          size: 20.sp,
        ),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(
        title,
        style: AppStyle.text18Semibold.copyWith(
          color: context.appColors.textPrimary,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Divider(
          height: 1.h,
          thickness: 1.h,
          color: context.appColors.border,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProductDetailsState state) {
    if (state is ProductDetailsFailure) {
      return Center(
        child: Text(
          state.message,
          style: AppStyle.text14Regular.copyWith(
            color: context.appColors.textSecondary,
          ),
        ),
      );
    }
    if (state is! ProductDetailsSuccess) {
      return Center(
        child: CircularProgressIndicator(color: context.appColors.primaryColor),
      );
    }
    final product = state.product;
    final images = product.images;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageGallery(imageUrl: images[_selectedImageIndex]),
          SizedBox(height: 12.h),
          ProductThumbnailsRow(
            images: images,
            selectedIndex: _selectedImageIndex,
            onSelect: (index) => setState(() => _selectedImageIndex = index),
          ),
          SizedBox(height: 20.h),
          ProductTitlePrice(
            title: product.name,
            price: '\$${product.finalPrice.toStringAsFixed(0)}',
            oldPrice: product.hasDiscount
                ? '\$${product.price.toStringAsFixed(0)}'
                : null,
            discount: product.hasDiscount
                ? '-${product.discountPercentage}% OFF'
                : null,
            rating: product.rating,
            reviewsCount: product.reviewsCount,
          ),
          SizedBox(height: 16.h),
          ProductDescriptionCard(description: product.description),
          SizedBox(height: 12.h),
          ProductSpecsCard(
            specs: {
              'Color': product.color,
              'Weight (g)': product.weight.toString(),
              'Stock': product.stock > 0
                  ? 'In stock: ${product.stock}'
                  : 'Out of stock',
            },
          ),
          SizedBox(height: 12.h),
          QuantitySelector(
            quantity: _quantity,
            onChanged: (value) => setState(() => _quantity = value),
          ),
          SizedBox(height: 16.h),
          AddToCartButton(
            totalPrice:
                '\$${(product.finalPrice * _quantity).toStringAsFixed(0)}',
            productId: product.id,
            quantity: _quantity,
          ),
          SizedBox(height: 24.h),
          Divider(height: 1.h, thickness: 1.h, color: context.appColors.border),
          SizedBox(height: 16.h),
          // --- Reviews الحقيقية ---
          BlocBuilder<ReviewsCubit, ReviewsState>(
            builder: (context, reviewsState) {
              final reviews = reviewsState.reviews;
              final avg = reviews.isEmpty
                  ? product.rating
                  : reviews.map((e) => e.rating).reduce((a, b) => a + b) /
                        reviews.length;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewsHeader(
                    rating: avg,
                    reviewsCount: reviews.length,
                    onWriteReview: () => _openAddReviewSheet(context),
                  ),
                  SizedBox(height: 12.h),
                  if (reviewsState.isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        color: context.appColors.primaryColor,
                      ),
                    )
                  else if (reviewsState.error != null && reviews.isEmpty)
                    Column(
                      children: [
                        Text(
                          reviewsState.error!,
                          textAlign: TextAlign.center,
                          style: AppStyle.text14Regular.copyWith(
                            color: context.appColors.textSecondary,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.read<ReviewsCubit>().getReviews(),
                          child: const Text('Retry'),
                        ),
                      ],
                    )
                  else if (reviews.isEmpty)
                    Center(
                      child: Text(
                        'No reviews yet. Be the first!',
                        style: AppStyle.text14Regular.copyWith(
                          color: context.appColors.textSecondary,
                        ),
                      ),
                    )
                  else
                    for (final review in reviews) ...[
                      ReviewTile(review: review),
                      SizedBox(height: 10.h),
                    ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
