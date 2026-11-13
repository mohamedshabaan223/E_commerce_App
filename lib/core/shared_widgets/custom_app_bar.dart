import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appColors.backgroundColor,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: context.appColors.white,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'DMSerifDisplay',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: context.appColors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
