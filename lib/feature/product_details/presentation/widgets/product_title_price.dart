// feature/product_details/presentation/widgets/product_title_price.dart
import 'package:ecommerce_app/core/shared_widgets/discount_badge.dart';
import 'package:ecommerce_app/core/shared_widgets/rating_stars.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitlePrice extends StatelessWidget {
  const ProductTitlePrice({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    this.oldPrice,
    this.discount,
  });

  final String title;
  final String price;
  final String? oldPrice;
  final String? discount;
  final double rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.text22Medium.copyWith(
                  fontSize: 24.sp,
                  color: context.appColors.textPrimary,
                  height: 1.15,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    if (oldPrice != null)
                      Text(
                        oldPrice!,
                        style: AppStyle.text12Regular.copyWith(
                          color: context.appColors.textSecondary,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    SizedBox(width: 6.w),
                    Text(
                      price,
                      style: AppStyle.text22Medium.copyWith(
                        color: context.appColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                if (discount != null) ...[
                  SizedBox(height: 4.h),
                  DiscountBadge(text: discount!),
                ],
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            RatingStars(rating: rating, starSize: 14.r),
            SizedBox(width: 8.w),
            Text(
              rating.toStringAsFixed(1),
              style: AppStyle.text14Semibold.copyWith(
                color: context.appColors.textPrimary,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '($reviewsCount reviews)',
              style: AppStyle.text14Regular.copyWith(
                color: context.appColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
