import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield {
  static Widget newTextField({
    required BuildContext context,
    required String hint,
    IconData? icon,
  }) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          color: context.appColors.textSecondary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(icon, color: context.appColors.white, size: 17),
        ),
        filled: true,
        fillColor: context.appColors.categoryCard,
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
      ),
    );
  }
}
