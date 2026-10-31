import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/custom_elevetedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.0.w),
        child: Column(
          children: [
            Spacer(flex: 1),
            SvgPicture.asset('assets/icons/Background.svg'),
            SizedBox(height: 10.h),
            Text(
              'No orders yet',
              style: AppStyle.text18Medium.copyWith(color: ColorsManger.white),
            ),
            SizedBox(height: 8.h),
            Text(
              '''You haven't placed any orders yet.
Start shopping to view your orders
                            here.''',
              style: AppStyle.text14Regular.copyWith(
                color: ColorsManger.primaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            CustomElevetedbutton(onPressed: () {}, label: 'Start Shopping'),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
