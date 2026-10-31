import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<_NavItemData> _items = [
    _NavItemData(label: 'Home', iconAsset: 'assets/icons/nav_home.svg'),
    _NavItemData(
      label: 'Categories',
      iconAsset: 'assets/icons/nav_categories.svg',
    ),
    _NavItemData(
      label: 'Cart',
      iconAsset: 'assets/icons/nav_cart.svg',
      hasBadge: true,
    ),
    _NavItemData(label: 'Profile', iconAsset: 'assets/icons/nav_profile.svg'),
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
              final iconColor = isSelected
                  ? ColorsManger.primaryColor
                  : ColorsManger.navInactive;
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
                          SvgPicture.asset(
                            item.iconAsset,
                            width: 22.r,
                            height: 22.r,
                            colorFilter: ColorFilter.mode(
                              iconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          if (item.hasBadge)
                            Positioned(
                              top: -4,
                              right: -6,
                              child: Container(
                                width: 16.r,
                                height: 16.r,
                                decoration: const BoxDecoration(
                                  color: ColorsManger.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: ColorsManger.cartBadgeBg,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
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
                          color: iconColor,
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
    required this.iconAsset,
    this.hasBadge = false,
  });

  final String label;
  final String iconAsset;
  final bool hasBadge;
}
