import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevetedbutton extends StatelessWidget {
  const CustomElevetedbutton({super.key, this.onPressed, required this.label});
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManger.primaryColor,
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(label, style: AppStyle.text14Semibold.copyWith(color: ColorsManger.black) ),
    );
  }
}
