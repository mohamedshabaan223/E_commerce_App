import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const new({super.key, required this.title, this.onPressed});
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: context.appColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios, color: context.appColors.white),
      ),
      title: Text(title, style: AppStyle.text18Semibold),
    );
  }
}
