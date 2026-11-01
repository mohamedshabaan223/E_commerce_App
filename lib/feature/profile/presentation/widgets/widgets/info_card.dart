// feature/profile/presentation/widgets/widgets/info_card.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_box.dart';

/// Card used in the Contact Us screen: icon + small label + content.
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget content;
  final String? tag;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.content,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IconBox already applies ScreenUtil scaling internally.
          IconBox(icon: icon, size: 48, iconSize: 22),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: AppTheme.body(
                          size: 10.sp,
                          color: context.colors.textSecondary,
                          weight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                    if (tag != null) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: context.colors.iconBox,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(tag!,
                            style: AppTheme.body(
                                size: 10.sp,
                                color: context.colors.textSecondary,
                                weight: FontWeight.w600)),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 6.h),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }
}