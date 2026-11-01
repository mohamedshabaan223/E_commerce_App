import 'package:ecommerce_app/core/shared_widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_button.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/cart_products_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      appBar: CustomAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Text(
                  "Shopping Cart",
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManger.white,
                  ),
                ),
                const Spacer(),
                Text(
                  "(2 ITEMS)",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManger.passwordColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CartItem.cartItemDesign(
                    image: CartProductsModel.cartProductsDetails[index].image,
                    name: CartProductsModel.cartProductsDetails[index].name,
                    price: CartProductsModel.cartProductsDetails[index].price,
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: ColorsManger.white),
                      decoration: InputDecoration(
                        hintText: 'Enter coupon code',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A2A2A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: ColorsManger.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CartButton.cartButtonDesign(
              context: context,
              page: const CheckoutScreen(),
              text: "Proceed to Checkout",
            ),
          ],
        ),
      ),
    );
  }
}