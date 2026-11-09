import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/product_details/data/models/mock.dart';
import 'package:ecommerce_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/Product_details_cubit.dart';
import 'package:ecommerce_app/feature/product_details/presentation/viewmodels/cubits/Product_details_state.dart';
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

  void _openAddReviewSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: ColorsManger.modalBackdrop,
      isScrollControlled: true,
      builder: (_) => const AddReviewSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductDetailsCubit(ProductDetailsRepo())..load(widget.productId),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsManger.backgroundColor,
            appBar: _buildAppBar(
              state is ProductDetailsSuccess ? state.product.name : '',
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      backgroundColor: ColorsManger.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: ColorsManger.primaryColor,
          size: 20.sp,
        ),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(
        title,
        style: AppStyle.text18Semibold.copyWith(
          color: ColorsManger.textPrimary,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Divider(height: 1.h, thickness: 1.h, color: ColorsManger.border),
      ),
    );
  }

  Widget _buildBody(ProductDetailsState state) {
    if (state is ProductDetailsFailure) {
      return Center(
        child: Text(
          state.message,
          style: AppStyle.text14Regular.copyWith(
            color: ColorsManger.textSecondary,
          ),
        ),
      );
    }
    if (state is! ProductDetailsSuccess) {
      return const Center(
        child: CircularProgressIndicator(color: ColorsManger.primaryColor),
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
          ),
          SizedBox(height: 24.h),
          Divider(height: 1.h, thickness: 1.h, color: ColorsManger.border),
          SizedBox(height: 16.h),
          ReviewsHeader(
            rating: product.rating,
            reviewsCount: product.reviewsCount,
            onWriteReview: _openAddReviewSheet,
          ),
          SizedBox(height: 12.h),
          for (final review in ProductDetailsMock.reviews) ...[
            ReviewTile(review: review),
            SizedBox(height: 10.h),
          ],
        ],
      ),
    );
  }
}
