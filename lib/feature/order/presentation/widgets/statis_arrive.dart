import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisArrive extends StatelessWidget {
  const StatisArrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorsManger.brown,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        'In Transit',
        style: AppStyle.text10Semibold.copyWith(color: ColorsManger.white),
      ),
    );
  }
}
