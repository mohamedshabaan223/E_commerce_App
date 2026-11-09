import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({
    super.key,
    required this.rating,
    required this.reviewsCount,
    this.onWriteReview,
  });

  final double rating;
  final int reviewsCount;
  final VoidCallback? onWriteReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rating.toStringAsFixed(1),
                style: AppStyle.text18Medium.copyWith(
                  color: context.appColors.textPrimary,
                ),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.star_border,
                color: context.appColors.primaryColor,
                size: 16.sp,
              ),
              SizedBox(width: 6.w),
              Flexible(
                child: Text(
                  '• $reviewsCount Reviews',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.text12Regular.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: onWriteReview,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: context.appColors.primaryColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.edit_outlined,
                  size: 14.sp,
                  color: context.appColors.primaryColor,
                ),
                SizedBox(width: 6.w),
                Text(
                  'WRITE A REVIEW',
                  style: AppStyle.text10Semibold.copyWith(
                    color: context.appColors.primaryColor,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
