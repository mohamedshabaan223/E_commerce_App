import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.onNotificationTap});
  final VoidCallback? onNotificationTap;

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManger.headerBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 56.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            'assets/images/luxe_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      titleSpacing: 12.w,
      title: Text(
        "LUXE ",
        style: AppStyle.text18Semibold.copyWith(
          color: ColorsManger.primaryColor,
          letterSpacing: 2,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onNotificationTap,
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_none),
              Positioned(
                top: 2,
                right: 2,
                child: Container(
                  width: 8.r,
                  height: 8.r,
                  decoration: BoxDecoration(
                    color: ColorsManger.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorsManger.backgroundColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          color: ColorsManger.primaryColor,
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
