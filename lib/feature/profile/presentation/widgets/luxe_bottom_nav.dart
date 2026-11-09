// feature/profile/presentation/widgets/widgets/luxe_bottom_nav.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LuxeBottomNav extends StatelessWidget {
  final int currentIndex;
  final int cartCount;
  final ValueChanged<int> onTap;

  const LuxeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.cartCount = 0,
  });

  static const _items = [
    (Icons.home_outlined, 'Home'),
    (Icons.category_outlined, 'Categories'),
    (Icons.shopping_bag_outlined, 'Cart'),
    (Icons.person_outline_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: context.appColors.darkCard,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: context.appColors.darkDivider),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < _items.length; i++)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(i),
                child: _NavItem(
                  icon: _items[i].$1,
                  label: _items[i].$2,
                  selected: i == currentIndex,
                  badge: i == 2 && cartCount > 0 ? cartCount : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final int? badge;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? context.appColors.darkGold
        : context.appColors.darkTextSecondary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon, color: color, size: 24.sp),
            if (badge != null)
              Positioned(
                top: -6.h,
                right: -8.w,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: context.appColors.darkGold,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$badge',
                    style: AppStyle.text9Bold.copyWith(
                      color: context.appColors.darkOnGold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(label, style: AppStyle.text11Regular.copyWith(color: color)),
      ],
    );
  }
}
