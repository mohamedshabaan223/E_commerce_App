import 'package:ecommerce_app/core/shared_widgets/product_card.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotDealsList extends StatelessWidget {
  const HotDealsList({super.key, required this.products});

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
<<<<<<< HEAD
        itemCount: 2,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
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
=======
        itemCount: products.length,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, i) {
          final p = products[i];
          final finalPrice = p.price * (1 - p.discountPercentage / 100);

          return SizedBox(
            width: 165.w,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(productId: p.id),
                ),
              ),
              child: ProductCard(
                imageUrl: p.coverPictureUrl,
                name: p.name,
                price: '\$${finalPrice.toStringAsFixed(0)}',
                oldPrice: '\$${p.price.toStringAsFixed(0)}',
                rating: p.rating,
                reviewsCount: p.reviewsCount,
                discountPercent: p.discountPercentage,
                isOutOfStock: p.stock == 0,
              ),
            ),
          );
        },
>>>>>>> 4c437ce78c9b5e268c8704af8176c848e07af7b5
      ),
    );
  }
}
