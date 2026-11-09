// feature/profile/presentation/widgets/widgets/luxe_app_bar.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LuxeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const LuxeAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appColors.darkBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: context.appColors.darkTextPrimary,
          size: 20.sp,
        ),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(
        title,
        style: AppStyle.text20Semibold.copyWith(
          color: context.appColors.darkTextPrimary,
        ),
      ),
    );
  }
}
