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
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            height: 64.r,
            width: 64.r,
            color: ColorsManger.surfaceVariant,
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
        ),
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
