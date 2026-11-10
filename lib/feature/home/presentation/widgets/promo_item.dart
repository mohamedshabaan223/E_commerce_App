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
    required this.count,
    required this.currentIndex,
  });
  final String imageUrl;
  final String tag;
  final String title;
  final String subtitle;
  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/promo_banner.png',
                fit: BoxFit.cover,
              );
            },
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.appColors.backgroundColor.withValues(alpha: 0.3),
                  context.appColors.backgroundColor.withValues(alpha: 0.9),
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
                    color: context.appColors.primaryColor,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: AppStyle.text22Medium.copyWith(
                    color: context.appColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: AppStyle.text14Regular.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    count,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      width: i == currentIndex ? 20.w : 6.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: i == currentIndex
                            ? context.appColors.primaryColor
                            : context.appColors.border,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
