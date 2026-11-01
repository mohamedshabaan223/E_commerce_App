import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChipItem extends StatelessWidget {
  const CategoryChipItem({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72.r,
          height: 72.r,
          decoration: BoxDecoration(
            color: ColorsManger.categoryCard,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManger.border, width: 1),
          ),
          padding: EdgeInsets.all(7.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          name,
          style: AppStyle.text12Medium.copyWith(
            color: ColorsManger.textPrimary,
          ),
        ),
      ],
    );
  }
}
