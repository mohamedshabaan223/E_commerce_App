// feature/profile/presentation/screens/screens/notifications_screen.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/data/models/notification_model.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/luxe_app_bar.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _showUnreadOnly = false;

  List<NotificationModel> _notifications = const [
    NotificationModel(
      time: '10m ago',
      prefix: 'Your order ',
      highlight: '#LX-84920',
      highlightIsGold: true,
      suffix: ' has been dispatched and is on its way.',
    ),
    NotificationModel(
      time: '2h ago',
      prefix: 'New arrival: ',
      highlight: 'Chronograph Noir 41mm',
      suffix: ' is back in stock.',
    ),
    NotificationModel(
      time: 'Yesterday',
      prefix: 'Your delivery address was successfully updated.',
      isRead: true,
    ),
  ];

  int get _unreadCount => _notifications.where((n) => !n.isRead).length;

  void _markAllRead() {
    setState(() {
      _notifications =
          _notifications.map((n) => n.copyWith(isRead: true)).toList();
    });
  }

  void _markRead(int index) {
    setState(() {
      final list = [..._notifications];
      list[index] = list[index].copyWith(isRead: true);
      _notifications = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final visible = <int>[
      for (int i = 0; i < _notifications.length; i++)
        if (!_showUnreadOnly || !_notifications[i].isRead) i
    ];

    return Scaffold(
      backgroundColor: ColorsManger.darkBackground,
      appBar: const LuxeAppBar(title: 'Notifications'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            _buildFilterRow(),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: visible.length,
                itemBuilder: (_, i) => NotificationItem(
                  notification: _notifications[visible[i]],
                  onTap: () => _markRead(visible[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: ColorsManger.darkCard,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            children: [
              _FilterChip(
                label: 'All',
                selected: !_showUnreadOnly,
                showDot: _unreadCount > 0,
                onTap: () => setState(() => _showUnreadOnly = false),
              ),
              _FilterChip(
                label: 'Unread',
                selected: _showUnreadOnly,
                onTap: () => setState(() => _showUnreadOnly = true),
              ),
            ],
          ),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: _markAllRead,
          icon: Icon(Icons.done_all_rounded,
              size: 16.sp, color: ColorsManger.darkTextSecondary),
          label: Text(
            'MARK ALL READ',
            style: AppStyle.text11Semibold.copyWith(
              color: ColorsManger.darkTextSecondary,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final bool showDot;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        selected ? ColorsManger.darkOnGold : ColorsManger.darkTextSecondary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: selected ? ColorsManger.darkGold : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Text(label,
                style: AppStyle.text13Semibold.copyWith(color: color)),
            if (showDot && selected) ...[
              SizedBox(width: 6.w),
              Container(
                width: 6.w,
                height: 6.h,
                decoration:
                    BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          ],
        ),
      ),
    );
  }
}