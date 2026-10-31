import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/statis_arrive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(0xff1F1F21),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#LX-84920',
                      style: AppStyle.text14Semibold.copyWith(
                        color: ColorsManger.white,
                      ),
                    ),
                    Text(
                      'Oct 24, 2024',
                      style: AppStyle.text12Regular.copyWith(
                        color: ColorsManger.white,
                      ),
                    ),
                  ],
                ),
              ),
              StatisArrive(),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAYMENT',
                    style: AppStyle.text10Semibold.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                  Text(
                    'Cash',
                    style: AppStyle.text14Regular.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TOTAL',
                    style: AppStyle.text10Semibold.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                  Text(
                    '\$180.00',
                    style: AppStyle.text14Regular.copyWith(
                      color: ColorsManger.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
