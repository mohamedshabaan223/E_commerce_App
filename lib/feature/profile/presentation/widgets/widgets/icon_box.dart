// feature/profile/presentation/widgets/widgets/icon_box.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final Color? color; // if null, the theme's gold color is used
  final double size;
  final double iconSize;

  // The defaults stay plain numbers so the constructor can remain `const`.
  // ScreenUtil scaling (.w / .h / .sp) is applied inside build().
  const IconBox({
    super.key,
    required this.icon,
    this.color,
    this.size = 44,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        color: context.colors.iconBox,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(
        icon,
        color: color ?? context.colors.gold,
        size: iconSize.sp,
      ),
    );
  }
}