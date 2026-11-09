import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customhead extends StatelessWidget {
  final String title, subtitle;

  const new({super.key, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.text22Medium.copyWith(color: ColorsManger.white),
        ),
        SizedBox(height: 5.h),
        Text(
          subtitle,
          style: const TextStyle(color: Color(0xffCFC5B8), fontFamily: null),
        ),
      ],
    );
  }
}
