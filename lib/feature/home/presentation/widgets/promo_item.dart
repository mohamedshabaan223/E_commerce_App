import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoItem extends StatelessWidget {
  const PromoItem({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.title,
    required this.subtitle,
  });
  final String imageUrl;
  final String tag;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          imageUrl.startsWith('http')
              ? Image.network(imageUrl, fit: BoxFit.cover)
              : Image.asset(imageUrl, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorsManger.backgroundColor.withValues(alpha: 0.3),
                  ColorsManger.backgroundColor.withValues(alpha: 0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tag,
                  style: AppStyle.text12Medium.copyWith(
                    color: ColorsManger.primaryColor,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: AppStyle.text22Medium.copyWith(
                    color: ColorsManger.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: AppStyle.text14Regular.copyWith(
                    color: ColorsManger.textSecondary,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: ColorsManger.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      width: 6.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: ColorsManger.border,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      width: 6.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: ColorsManger.border,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
