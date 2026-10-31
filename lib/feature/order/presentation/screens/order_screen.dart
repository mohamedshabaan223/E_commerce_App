import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/custom_elevetedbutton.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorsManger.white,
        ),
        centerTitle: true,
        title: Text(
          'My Orders',
          style: AppStyle.text18Semibold.copyWith(color: ColorsManger.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Orders',
                    style: AppStyle.text22Medium.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                  Text(
                    '3 orders',
                    style: AppStyle.text12Medium.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => OrderItem(),
              ),
              SizedBox(height: 40.h),
              CustomElevetedbutton(onPressed: () {}, label: 'Checkout'),
                             SizedBox(height: 30.h),

            ],
          ),
        ),
      ),
    );
  }
}
