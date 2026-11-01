import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String imageAsset;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), // TODO: measure
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            color: ColorsManger.categoryCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 2.2 / 1, // TODO: measure
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(imageAsset, fit: BoxFit.cover),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              ColorsManger.backgroundColor.withValues(
                                alpha: 0.6,
                              ),
                              ColorsManger.backgroundColor,
                            ],
                            stops: const [0.6, 0.9, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyle.text18Medium.copyWith(
                          color: ColorsManger.textPrimary,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        subtitle,
                        style: AppStyle.text12Regular.copyWith(
                          color: ColorsManger.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
