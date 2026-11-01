import 'package:ecommerce_app/core/shared_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotDealsList extends StatelessWidget {
  const HotDealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (_, i) => SizedBox(
          width: 165.w,
          child: ProductCard(
            imageUrl: i == 0
                ? 'assets/images/category_watches.png'
                : 'assets/images/category_rings.png',
            name: i == 0 ? 'Minimalist Chronograph' : 'Gold Signet Ring',
            price: i == 0 ? '\$240' : '\$180',
            oldPrice: i == 0 ? '\$320' : '\$225',
            rating: i == 0 ? 4.9 : 4.7,
            reviewsCount: i == 0 ? 88 : 42,
            discountPercent: i == 0 ? 25 : 20,
          ),
        ),
      ),
    );
  }
}
