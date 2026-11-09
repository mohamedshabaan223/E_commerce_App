// feature/profile/presentation/widgets/widgets/notification_item.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItem({super.key, required this.notification, this.onTap});

  @override
  Widget build(BuildContext context) {
    final unread = !notification.isRead;
    final baseColor = unread
        ? context.appColors.darkTextPrimary
        : context.appColors.darkTextMuted;
    final base = AppStyle.text15Regular.copyWith(color: baseColor, height: 1.4);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
        decoration: BoxDecoration(
          color: context.appColors.darkCard,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            if (unread)
              Positioned(
                top: 4.h,
                left: 36.w,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: context.appColors.darkGold,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: context.appColors.darkGoldGlow,
                        blurRadius: 8.r,
                      ),
                    ],
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    notification.time,
                    style: AppStyle.text12Regular.copyWith(
                      color: unread
                          ? context.appColors.darkTextSecondary
                          : context.appColors.darkTextMuted,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(left: 52.w),
                  child: Text.rich(
                    TextSpan(
                      style: base,
                      children: [
                        TextSpan(text: notification.prefix),
                        if (notification.highlight != null)
                          TextSpan(
                            text: notification.highlight,
                            style: base.copyWith(
                              color: notification.highlightIsGold
                                  ? context.appColors.darkGold
                                  : context.appColors.darkTextPrimary,
                              fontWeight: notification.highlightIsGold
                                  ? FontWeight.w400
                                  : FontWeight.w700,
                            ),
                          ),
                        TextSpan(text: notification.suffix),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
