// feature/product_details/presentation/widgets/product_description_card.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionCard extends StatelessWidget {
  const ProductDescriptionCard({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.appColors.border),
      ),
      child: Text(
        description,
        style: AppStyle.text14Regular.copyWith(
          color: context.appColors.textSecondary,
          height: 1.45,
        ),
      ),
    );
  }
}
