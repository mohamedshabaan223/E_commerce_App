import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/product_details/presentation/models/mock.dart';
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

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

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
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      appBar: AppBar(
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
          'Chronographe Noir',
          style: AppStyle.text18Semibold.copyWith(
            color: ColorsManger.textPrimary,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Divider(
            height: 1.h,
            thickness: 1.h,
            color: ColorsManger.border,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageGallery(
              imageAsset: ProductDetailsMock.images[_selectedImageIndex],
            ),
            SizedBox(height: 12.h),
            ProductThumbnailsRow(
              images: ProductDetailsMock.images,
              selectedIndex: _selectedImageIndex,
              onSelect: (index) => setState(() => _selectedImageIndex = index),
            ),
            SizedBox(height: 20.h),
            const ProductTitlePrice(
              title: ProductDetailsMock.title,
              price: ProductDetailsMock.price,
              oldPrice: ProductDetailsMock.oldPrice,
              discount: ProductDetailsMock.discount,
              rating: ProductDetailsMock.rating,
              reviewsCount: ProductDetailsMock.reviewsCount,
            ),
            SizedBox(height: 16.h),
            const ProductDescriptionCard(
              description: ProductDetailsMock.description,
            ),
            SizedBox(height: 12.h),
            const ProductSpecsCard(specs: ProductDetailsMock.specs),
            SizedBox(height: 12.h),
            QuantitySelector(
              quantity: _quantity,
              onChanged: (value) => setState(() => _quantity = value),
            ),
            SizedBox(height: 16.h),
            AddToCartButton(
              totalPrice: '\$${ProductDetailsMock.unitPrice * _quantity}',
              onPressed: () {},
            ),
            SizedBox(height: 24.h),
            Divider(height: 1.h, thickness: 1.h, color: ColorsManger.border),
            SizedBox(height: 16.h),
            ReviewsHeader(
              rating: ProductDetailsMock.rating,
              reviewsCount: ProductDetailsMock.reviewsCount,
              onWriteReview: _openAddReviewSheet,
            ),
            SizedBox(height: 12.h),
            for (final review in ProductDetailsMock.reviews) ...[
              ReviewTile(review: review),
              SizedBox(height: 10.h),
            ],
          ],
        ),
      ),
    );
  }
}
