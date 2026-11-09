import 'package:ecommerce_app/core/shared_widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_button.dart';
import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      appBar: CustomAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.appColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.appColors.categoryCard,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: context.appColors.primaryColor,
                  size: 29,
                ),
              ),
            ),
            Text(
              "Your cart is empty",
              style: TextStyle(
                color: context.appColors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Looks like you haven't added any items to "
              "your cart yet.",
              style: TextStyle(
                color: context.appColors.passwordColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            CartButton.cartButtonDesign(
              context: context,
              page: MainScreen(),
              text: "Browse Products",
            ),
          ],
        ),
      ),
    );
  }
}
