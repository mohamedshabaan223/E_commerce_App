// feature/product_details/presentation/widgets/product_image_gallery.dart
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageGallery extends StatelessWidget {
  const ProductImageGallery({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.appColors.border, width: 1),
      ),
      child: Center(child: Image.network(imageUrl, fit: BoxFit.contain)),
    );
  }
}
