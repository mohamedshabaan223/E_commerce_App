import 'package:ecommerce_app/feature/home/presentation/widgets/category_chips_items.dart';
import 'package:flutter/material.dart';

class CategoryChipsRow extends StatelessWidget {
  const CategoryChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryChipItem(
          imageUrl: 'assets/images/category_watches.png',
          name: 'Watches',
        ),
        CategoryChipItem(
          imageUrl: 'assets/images/category_rings.png',
          name: 'Rings',
        ),
        CategoryChipItem(
          imageUrl: 'assets/images/category_wallets.png',
          name: 'Wallets',
        ),
        CategoryChipItem(
          imageUrl: 'assets/images/category_sunglasses.png',
          name: 'Sunglasses',
        ),
      ],
    );
  }
}
