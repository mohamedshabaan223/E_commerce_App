// feature/profile/presentation/widgets/widgets/notification_item.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/models/notification_model.dart';
import 'package:flutter/material.dart';


class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItem({super.key, required this.notification, this.onTap});

  @override
  Widget build(BuildContext context) {
    final unread = !notification.isRead;
    final baseColor = unread ? context.colors.textPrimary : context.colors.textMuted;
    final base = AppTheme.body(size: 15, color: baseColor, height: 1.4);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        decoration: BoxDecoration(
          color: context.colors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            if (unread)
              Positioned(
                top: 4,
                left: 36,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: context.colors.gold,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x99C9AE7C),
                          blurRadius: 8),
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
                          size: 12,
                          color: unread
                              ? context.colors.textSecondary
                              : context.colors.textMuted)),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 52),
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
