import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/core/utils/images_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(0XFF1B1B1D),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(ImagesManger.radioIndicator),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              spacing: 3.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '742 Evergreen TerraceApt 4B',
                  style: AppStyle.text14Regular.copyWith(
                    color: ColorsManger.white,
                  ),
                ),
                Text(
                  'New York, NY',
                  style: AppStyle.text12Regular.copyWith(
                    color: ColorsManger.white,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImagesManger.phoneIcon),
                    SizedBox(width: 5.w),

                    Text(
                      '+1 (555) 234-5678',
                      style: AppStyle.text12Regular.copyWith(
                        color: Color(0xffCFC5B8),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImagesManger.icon),
                    SizedBox(width: 7.w),
                    Text(
                      'Leave package at front door',
                      style: AppStyle.text12Regular.copyWith(
                        color: Color(0xffCFC5B8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
