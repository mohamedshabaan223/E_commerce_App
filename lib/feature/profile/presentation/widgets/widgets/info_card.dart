// feature/profile/presentation/widgets/widgets/info_card.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
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
        color: ColorsManger.darkCard,
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
                      style: AppStyle.text10Semibold.copyWith(
                        color: ColorsManger.darkTextSecondary,
                        letterSpacing: 1,
                      ),
                    ),
                    if (tag != null) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: ColorsManger.darkIconBox,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          tag!,
                          style: AppStyle.text10Semibold.copyWith(
                            color: ColorsManger.darkTextSecondary,
                          ),
                        ),
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