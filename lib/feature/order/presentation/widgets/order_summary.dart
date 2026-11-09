import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/row_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.appColors.cardSurface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order summary',
            style: AppStyle.text14Semibold.copyWith(
              color: context.appColors.white,
            ),
          ),
          SizedBox(height: 10.h),
          RowPrice(
            label: 'Subtotal',
            price: '640 EGP',
            textStylePrice: AppStyle.text14Regular.copyWith(
              color: context.appColors.primaryColor,
            ),
            textStyleLabel: AppStyle.text14Regular.copyWith(
              color: context.appColors.primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          RowPrice(
            label: 'Discount',
            price: '\$40.00',
            textStylePrice: AppStyle.text14Regular.copyWith(
              color: context.appColors.primaryColor,
            ),
            textStyleLabel: AppStyle.text14Regular.copyWith(
              color: context.appColors.primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          RowPrice(
            label: 'Total',
            price: '\$380.00',
            textStylePrice: AppStyle.text22Semibold.copyWith(
              color: context.appColors.white,
            ),
            textStyleLabel: AppStyle.text18Semibold.copyWith(
              color: context.appColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
