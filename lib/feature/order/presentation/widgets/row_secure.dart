import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/core/utils/images_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowSecure extends StatelessWidget {
  const RowSecure({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImagesManger.closedIcon),
        SizedBox(width: 6.w,),
        Text('You will be redirected to a secure payment page' , style: AppStyle.text12Regular.copyWith(color: ColorsManger.white),)
      ],
    );
  }
}