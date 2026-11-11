import 'package:ecommerce_app/feature/categories/presentation/screens/category_products_screen.dart';
import 'package:ecommerce_app/feature/home/data/models/category_model.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/category_chips_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/language/category_localization.dart';

class CategoryChipsRow extends StatelessWidget {
  const CategoryChipsRow({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    // إخفاء الأقسام التجريبية القادمة من API
    final visibleCategories = categories.where((category) {
      final name = category.name.trim().toLowerCase();

      return name.isNotEmpty && name != 'string' && name != 'istring';
    }).toList();

    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: visibleCategories.length,
        separatorBuilder: (_, _) => SizedBox(width: 16.w),

        itemBuilder: (context, i) {
          final category = visibleCategories[i];

          return CategoryChipItem(
            imageUrl: category.coverPictureUrl,

            name: localizeCategoryName(context, category.name),

            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    CategoryProductsScreen(categoryName: category.name),
              ),
            ),
          );
        },
      ),
    );
  }
}
