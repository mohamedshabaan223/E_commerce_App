import 'package:ecommerce_app/core/shared_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsGrid extends StatelessWidget {
  const AllProductsGrid({super.key});

  static const List<_ProductData> _products = [
    _ProductData(
      imageUrl: 'assets/images/product_automatic_exhibition.png',
      name: 'Automatic Exhibition',
      price: '\$350',
      rating: 5.0,
      reviewsCount: 31,
    ),
    _ProductData(
      imageUrl: 'assets/images/product_titanium_sunglasses.png',
      name: 'Titanium Sunglasses',
      price: '\$160',
      oldPrice: '\$200',
      discountPercent: 20,
      rating: 4.6,
      reviewsCount: 54,
    ),
    _ProductData(
      imageUrl: 'assets/images/product_classic_chrono_dial.png',
      name: 'Classic Chrono Dial',
      price: '\$290',
      rating: 4.8,
      reviewsCount: 19,
    ),
    _ProductData(
      imageUrl: 'assets/images/product_gold_crown_timepiece.png',
      name: 'Gold Crown Timepiece',
      price: '\$310',
      rating: 4.9,
      reviewsCount: 47,
      isOutOfStock: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (_, i) {
        final product = _products[i];
        return ProductCard(
          imageUrl: product.imageUrl,
          name: product.name,
          price: product.price,
          oldPrice: product.oldPrice,
          rating: product.rating,
          reviewsCount: product.reviewsCount,
          discountPercent: product.discountPercent,
          isOutOfStock: product.isOutOfStock,
        );
      },
    );
  }
}

class _ProductData {
  const _ProductData({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.discountPercent,
    this.rating,
    this.reviewsCount,
    this.isOutOfStock = false,
  });

  final String imageUrl;
  final String name;
  final String price;
  final String? oldPrice;
  final int? discountPercent;
  final double? rating;
  final int? reviewsCount;
  final bool isOutOfStock;
}
