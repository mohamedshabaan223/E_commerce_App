import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.rating,
    this.reviewsCount,
    this.discountPercent,
    this.isOutOfStock = false,
  });

  final String imageUrl;
  final String name;
  final String price;
  final String? oldPrice;
  final double? rating;
  final int? reviewsCount;
  final int? discountPercent;
  final bool isOutOfStock;

  @override
  Widget build(BuildContext context) {
    final badge = isOutOfStock
        ? 'Out of Stock'
        : (discountPercent != null ? '-$discountPercent%' : null);

    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: ColorsManger.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManger.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Opacity(
                    opacity: isOutOfStock ? 0.5 : 1,
                    child: imageUrl.startsWith('http')
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: Colors.black26,
                              child: const Icon(Icons.image_not_supported),
                            ),
                          )
                        : Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: Colors.black26,
                              child: const Icon(Icons.image_not_supported),
                            ),
                          ),
                  ),
                ),
                if (badge != null)
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManger.dealsBadgeBg,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          color: ColorsManger.primaryColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          if (rating != null)
            Row(
              children: [
                Icon(Icons.star, size: 12.sp, color: ColorsManger.primaryColor),
                SizedBox(width: 3.w),
                Text(
                  '$rating (${reviewsCount ?? 0})',
                  style: TextStyle(
                    color: ColorsManger.textPrimary,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          SizedBox(height: 4.h),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorsManger.textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                price,
                style: AppStyle.text18Semibold.copyWith(
                  color: ColorsManger.textPrimary,
                ),
              ),
              if (oldPrice != null) ...[
                SizedBox(width: 6.w),
                Text(
                  oldPrice!,
                  style: TextStyle(
                    color: ColorsManger.textSecondary,
                    fontSize: 11.sp,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
