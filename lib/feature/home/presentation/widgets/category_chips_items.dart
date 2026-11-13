import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChipItem extends StatelessWidget {
  const CategoryChipItem({
    super.key,
    required this.imageUrl,
    required this.name,
    this.onTap,
  });

  final String imageUrl;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            width: 72.r,
            height: 72.r,
            decoration: BoxDecoration(
              color: context.appColors.categoryCard,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: context.appColors.border, width: 1),
            ),
            padding: EdgeInsets.all(7.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    ColoredBox(color: context.appColors.surface),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            name,
            style: AppStyle.text12Medium.copyWith(
              color: context.appColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
