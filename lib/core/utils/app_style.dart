import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle {
  static TextStyle text18Semibold = TextStyle(
    fontFamily: 'DMSerifDisplay',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle text10Semibold = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle text18Medium = TextStyle(
    fontFamily: 'DMSerifDisplay',
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle text12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle text14Semibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle text22Medium = TextStyle(
    fontFamily: 'DMSerifDisplay',
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text12Medium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
}