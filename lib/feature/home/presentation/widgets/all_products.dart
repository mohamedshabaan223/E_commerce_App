import 'package:ecommerce_app/core/shared_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/feature/home/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';

class AllProductsGrid extends StatelessWidget {
  const AllProductsGrid({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, i) {
        final p = products[i];
        final hasDiscount = p.discountPercentage > 0;
        final finalPrice = hasDiscount
            ? p.price * (1 - p.discountPercentage / 100)
            : p.price;

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProductDetailsScreen()),
          ),
          child: ProductCard(
            imageUrl: p.coverPictureUrl,
            name: p.name,
            price: '\$${finalPrice.toStringAsFixed(0)}',
            oldPrice: hasDiscount ? '\$${p.price.toStringAsFixed(0)}' : null,
            rating: p.rating,
            reviewsCount: p.reviewsCount,
            discountPercent: hasDiscount ? p.discountPercentage : null,
            isOutOfStock: p.stock == 0,
          ),
        );
      },
    );
  }
}
