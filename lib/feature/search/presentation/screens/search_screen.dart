import 'package:ecommerce_app/core/shared_widgets/custom_search_bar.dart';
import 'package:ecommerce_app/core/shared_widgets/product_card.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController(
    text: 'Chronograph',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _controller.clear();
    });
  }

  static const List<_ProductData> _products = [
    _ProductData(
      imageUrl: 'assets/images/category_watches.png',
      name: 'Minimalist Chronograph',
      price: '\$240',
      oldPrice: '\$320',
      discountPercent: 25,
      rating: 4.9,
      reviewsCount: 88,
    ),
    _ProductData(
      imageUrl: 'assets/images/product_monochrome_chrono.png',
      name: 'Monochrome Chrono',
      price: '\$375',
      oldPrice: '\$500',
      discountPercent: 25,
      rating: 4.9,
      reviewsCount: 42,
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
    ),
    _ProductData(
      imageUrl: 'assets/images/product_automatic_exhibition.png',
      name: 'Automatic Chronograph',
      price: '\$350',
      oldPrice: '\$440',
      discountPercent: 20,
      rating: 5.0,
      reviewsCount: 31,
    ),
    _ProductData(
      imageUrl: 'assets/images/product_monochrome_chrono.png',
      name: 'Pilot Chrono Noir',
      price: '\$380',
      rating: 4.8,
      reviewsCount: 26,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchTopBar(),
            Divider(height: 1, thickness: 1, color: ColorsManger.border),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    CustomSearchBar(
                      controller: _controller,
                      hint: 'Search products',
                      onChanged: (_) => setState(() {}),
                      onClear: _clearSearch,
                      hasBorder: true,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      '12 results',
                      style: AppStyle.text12Regular.copyWith(
                        color: ColorsManger.textSecondary,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GridView.builder(
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
                        final p = _products[i];
                        return ProductCard(
                          imageUrl: p.imageUrl,
                          name: p.name,
                          price: p.price,
                          oldPrice: p.oldPrice,
                          rating: p.rating,
                          reviewsCount: p.reviewsCount,
                          discountPercent: p.discountPercent,
                        );
                      },
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: ColorsManger.textPrimary,
                size: 20.sp,
              ),
            ),
          ),
          Text(
            'Search',
            style: AppStyle.text18Medium.copyWith(
              color: ColorsManger.textPrimary,
            ),
          ),
        ],
      ),
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
  });

  final String imageUrl;
  final String name;
  final String price;
  final String? oldPrice;
  final int? discountPercent;
  final double? rating;
  final int? reviewsCount;
}
