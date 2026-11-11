import 'package:ecommerce_app/core/shared_widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/Cubit/add_to_cart_cubit.dart';
import 'package:ecommerce_app/feature/cart/Cubit/cart_states.dart';
import 'package:ecommerce_app/feature/cart/Cubit/get_cart_cubit.dart';
import 'package:ecommerce_app/feature/cart/presentation/screens/empty_cart_screen.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_button.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({required this.onBrowseProducts, super.key});

  final VoidCallback onBrowseProducts;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController couponController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, CartState>(
      listenWhen: (previous, state) =>
          state is AddToCartSuccessState ||
          state is DecCartItemSuccessState ||
          state is DeleteCartItemSuccessState,
      listener: (context, state) {
        context.read<GetCartCubit>().getCart();
      },

      child: BlocBuilder<GetCartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartLoadingState) {
            return Scaffold(
              backgroundColor: context.appColors.backgroundColor,
              appBar: CustomAppBar(title: 'Cart'),
              body: Center(
                child: CircularProgressIndicator(
                  color: context.appColors.primaryColor,
                ),
              ),
            );
          }

          if (state is GetCartFailureState) {
            return Scaffold(
              backgroundColor: context.appColors.backgroundColor,
              appBar: CustomAppBar(title: 'Cart'),
              body: Center(child: Text(state.errorMessage)),
            );
          }

          if (state is GetCartSuccessState) {
            final List cartItems = state.cartItems['cartItems'] ?? [];

            if (cartItems.isEmpty) {
              return EmptyCartScreen(onBrowseProducts: widget.onBrowseProducts);
            }

            return Scaffold(
              backgroundColor: context.appColors.backgroundColor,
              appBar: CustomAppBar(title: 'Cart'),
              body: Padding(
                padding: EdgeInsets.all(20),
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
                            color: context.appColors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "(${cartItems.length} ITEMS)",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: context.appColors.passwordColor,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return CartItem.cartItemDesign(
                            context: context,
                            image: item['productCoverUrl'] ?? '',
                            name: item['productName'] ?? '',
                            price: item['totalPrice'].toDouble(),
                            quantity: item['quantity'],
                            productId: item['productId'],
                            itemId: item['itemId'],
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
                              color: context.appColors.forTheme(
                                Color(0xFF1E1E1E),
                                ColorsManger.lightSurfaceVariant,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              style: TextStyle(color: context.appColors.white),
                              decoration: InputDecoration(
                                hintText: 'Enter coupon code',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                              controller: couponController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              final couponCode = couponController.text.trim();

                              if (couponCode.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a coupon code'),
                                  ),
                                );
                                return;
                              }

                              context.read<AddToCartCubit>().applyCoupon(
                                couponCode: couponCode,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.appColors.forTheme(
                                Color(0xFF2A2A2A),
                                ColorsManger.lightSurfaceVariant,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 24),
                            ),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                color: context.appColors.primaryColor,
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
                      page: CheckoutScreen(),
                      text: "Proceed to Checkout",
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(backgroundColor: context.appColors.backgroundColor);
        },
      ),
    );
  }
}
