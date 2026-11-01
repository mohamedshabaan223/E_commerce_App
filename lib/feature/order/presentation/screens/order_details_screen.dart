import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/order_reference.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/order_time_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: AppStyle.text18Semibold.copyWith(color: ColorsManger.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: ColorsManger.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderReference(),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B1D),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  const OrderTimelineTile(
                    title: 'Order Placed',
                    subtitle: 'Oct 24, 2024 - 10:30 AM\nOrder confirmed and verified.',
                    isFirst: true,
                    isCompleted: true,
                  ),
                  const OrderTimelineTile(
                    title: 'Processing',
                    subtitle: 'Oct 24, 2024 - 02:15 PM\nItems packed and prepared for shipment.',
                    isCompleted: true,
                  ),
                  const OrderTimelineTile(
                    title: 'In Transit',
                    subtitle: 'Oct 25, 2024 - 09:00 AM\nCarrier dispatched, on the way to destination.',
                    isCompleted: true,
                    isCurrent: true,
                  ),
                  const OrderTimelineTile(
                    title: 'Delivered',
                    subtitle: 'Expected Oct 27, 2024\nAwaiting final delivery.',
                    isLast: true,
                    isCompleted: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
