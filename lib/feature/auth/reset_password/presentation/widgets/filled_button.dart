import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const new({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42.h,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: context.appColors.primaryColor,
          foregroundColor: context.appColors.foreground,
          disabledBackgroundColor: context.appColors.primaryColor,
          disabledForegroundColor: context.appColors.foreground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyle.text14Semibold.copyWith(
            color: context.appColors.foreground,
          ),
        ),
      ),
    );
  }
}
