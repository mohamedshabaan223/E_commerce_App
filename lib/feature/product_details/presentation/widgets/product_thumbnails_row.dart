import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductThumbnailsRow extends StatelessWidget {
  const ProductThumbnailsRow({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<String> images;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final (index, image) in images.indexed) ...[
          if (index > 0) SizedBox(width: 12.w),
          GestureDetector(
            onTap: () => onSelect(index),
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 56.r,
              height: 56.r,
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: context.appColors.surface,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: index == selectedIndex
                      ? context.appColors.primaryColor
                      : context.appColors.border,
                  width: index == selectedIndex ? 1.5 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
