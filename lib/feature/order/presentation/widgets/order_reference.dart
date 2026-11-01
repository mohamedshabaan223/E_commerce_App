import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/row_details_payment.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/statis_arrive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderReference extends StatelessWidget {
  const OrderReference({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(0XFF1B1B1D),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'ORDER REFERENCE',
                    style: AppStyle.text10Semibold.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                  Text(
                    '#LX-84920',
                    style: AppStyle.text18Semibold.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                ],
              ),
              StatisArrive(),
            ],
          ),
          Divider(height: 30.h),
          Row(
            children: [
              Expanded(child: RowDetailsPayment(title: 'Payment Method', subTitle: 'Card')),
             SizedBox(width: 10.w,),
              Expanded(child: RowDetailsPayment(title: 'Total', subTitle: '\$380.00')),
            ],
          ),
        ],
      ),
    );
  }
}
