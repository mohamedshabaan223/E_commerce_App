import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/core/utils/images_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/custom_elevetedbutton.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/delivery_details.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/order_summary.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/row_secure.dart';
import 'package:ecommerce_app/feature/order/presentation/widgets/type_payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentTypeMethods paymentTypeMethods = PaymentTypeMethods.card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: AppStyle.text18Semibold.copyWith(
            color: context.appColors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: context.appColors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Delivery Address',
                    style: AppStyle.text14Semibold.copyWith(
                      color: context.appColors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  DeliveryDetails(),
                  SizedBox(height: 10.h),
                  CustomElevetedbutton(
                    onPressed: () {},
                    backgroundColor: context.appColors.cardSurface,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImagesManger.addIcon),
                        SizedBox(width: 10.w),
                        Text(
                          'Add new address',
                          style: AppStyle.text14Medium.copyWith(
                            color: context.appColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Payment Method',
                    style: AppStyle.text14Semibold.copyWith(
                      color: context.appColors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  InkWell(
                    onTap: () {
                      paymentTypeMethods = PaymentTypeMethods.card;
                      setState(() {});
                    },
                    child: TypePaymentMethods(
                      selectedType: PaymentTypeMethods.card,
                      label: 'Card',
                      icon: Icons.payment,
                      icoColor: paymentTypeMethods == PaymentTypeMethods.card
                          ? context.appColors.primaryColor
                          : context.appColors.white,
                      iconPath: paymentTypeMethods == PaymentTypeMethods.card
                          ? ImagesManger.radioIndicator
                          : ImagesManger.unselectedIcon,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () {
                      paymentTypeMethods = PaymentTypeMethods.cash;

                      setState(() {});
                    },
                    child: TypePaymentMethods(
                      selectedType: PaymentTypeMethods.cash,
                      label: 'Cash',
                      icon: Icons.payments_outlined,
                      icoColor: paymentTypeMethods == PaymentTypeMethods.cash
                          ? context.appColors.primaryColor
                          : context.appColors.white,
                      iconPath: paymentTypeMethods == PaymentTypeMethods.cash
                          ? ImagesManger.radioIndicator
                          : ImagesManger.unselectedIcon,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RowSecure(),

                  SizedBox(height: 24.h),
                  OrderSummary(),
                  SizedBox(height: 24.h),
                  CustomElevetedbutton(onPressed: () {}, label: 'Place Order'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum PaymentTypeMethods { card, cash }
