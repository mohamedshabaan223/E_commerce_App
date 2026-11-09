import 'package:ecommerce_app/feature/categories/presentation/screens/category_products_screen.dart';
import 'package:ecommerce_app/feature/home/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/category_chips_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChipsRow extends StatelessWidget {
  const CategoryChipsRow({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 16.w),
        itemBuilder: (_, i) => CategoryChipItem(
          imageUrl: categories[i].coverPictureUrl,
          name: categories[i].name,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  CategoryProductsScreen(categoryName: categories[i].name),
            ),
          ),
        ),
      ),
    );
  }
}
