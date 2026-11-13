import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevetedbutton extends StatelessWidget {
  const CustomElevetedbutton({
    super.key,
    this.onPressed,
    this.label,
    this.backgroundColor,
    this.textColor,
    this.child,
  });
  final void Function()? onPressed;
  final String? label;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.appColors.primaryColor,
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child:
          child ??
          Text(
            label ?? '',
            style: AppStyle.text14Semibold.copyWith(
              color: textColor ?? context.appColors.black,
            ),
          ),
    );
  }
}
