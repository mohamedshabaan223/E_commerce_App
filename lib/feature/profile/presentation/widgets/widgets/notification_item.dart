// feature/profile/presentation/widgets/widgets/notification_item.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItem({super.key, required this.notification, this.onTap});

  @override
  Widget build(BuildContext context) {
    final unread = !notification.isRead;
    final baseColor =
        unread ? context.colors.textPrimary : context.colors.textMuted;
    final base = AppTheme.body(size: 15.sp, color: baseColor, height: 1.4);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
        decoration: BoxDecoration(
          color: context.colors.card,
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
                    color: context.colors.gold,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x99C9AE7C),
                          blurRadius: 8.r),
                    ],
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(notification.time,
                      style: AppTheme.body(
                          size: 12.sp,
                          color: unread
                              ? context.colors.textSecondary
                              : context.colors.textMuted)),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(left: 52.w),
                  child: Text.rich(
                    TextSpan(style: base, children: [
                      TextSpan(text: notification.prefix),
                      if (notification.highlight != null)
                        TextSpan(
                          text: notification.highlight,
                          style: base.copyWith(
                            color: notification.highlightIsGold
                                ? context.colors.gold
                                : context.colors.textPrimary,
                            fontWeight: notification.highlightIsGold
                                ? FontWeight.w400
                                : FontWeight.w700,
                          ),
                        ),
                      TextSpan(text: notification.suffix),
                    ]),
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