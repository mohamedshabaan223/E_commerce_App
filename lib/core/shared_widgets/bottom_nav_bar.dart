import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<_NavItemData> _items = [
    _NavItemData(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    _NavItemData(
      label: 'Categories',
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view,
    ),
    _NavItemData(
      label: 'Cart',
      icon: Icons.shopping_bag_outlined,
      activeIcon: Icons.shopping_bag,
      hasBadge: true,
    ),
    _NavItemData(
      label: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManger.navBackground,
            borderRadius: BorderRadius.circular(34.r),
            border: Border.all(color: ColorsManger.navBorder),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_items.length, (index) {
              final isSelected = index == currentIndex;
              final item = _items[index];
              return GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 72.w,
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsManger.navBackground
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(
                            isSelected ? item.activeIcon : item.icon,
                            size: 20.sp,
                            color: isSelected
                                ? ColorsManger.primaryColor
                                : ColorsManger.navInactive,
                          ),
                          if (item.hasBadge)
                            Positioned(
                              top: -1,
                              right: -1,
                              child: Container(
                                width: 6.r,
                                height: 6.r,
                                decoration: const BoxDecoration(
                                  color: ColorsManger.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: isSelected
                              ? FontWeight.w500
                              : FontWeight.normal,
                          color: isSelected
                              ? ColorsManger.primaryColor
                              : ColorsManger.navInactive,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.hasBadge = false,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final bool hasBadge;
}
