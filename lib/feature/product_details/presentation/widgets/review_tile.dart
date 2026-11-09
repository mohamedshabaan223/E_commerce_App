import 'package:ecommerce_app/core/shared_widgets/rating_stars.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/product_details/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final ReviewModel review;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: context.appColors.dealsBadgeBg,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  review.initials,
                  style: AppStyle.text10Semibold.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.text14Semibold.copyWith(
                        color: context.appColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      review.date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.text12Regular.copyWith(
                        color: context.appColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              RatingStars(rating: review.rating, starSize: 12.r),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            review.comment,
            style: AppStyle.text12Regular.copyWith(
              color: context.appColors.textSecondary,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
