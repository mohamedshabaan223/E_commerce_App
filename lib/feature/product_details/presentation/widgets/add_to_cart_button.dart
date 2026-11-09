import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/Cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/Cubit/cart_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.totalPrice,
    required this.productId,
  });

  final String totalPrice;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully added to cart'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AddToCartFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<CartCubit>().addToCart(productId: productId);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: double.infinity,
            height: 52.h,
            decoration: BoxDecoration(
              color: state is AddToCartLoadingState
                  ? Colors.grey
                  : ColorsManger.primaryColor,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                if (state is AddToCartLoadingState)
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
              ],
            ),
            alignment: Alignment.center,
            child: state is AddToCartLoadingState
                ? SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: CircularProgressIndicator(
                      color: ColorsManger.backgroundColor,
                      strokeWidth: 2.5,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: ColorsManger.backgroundColor,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'ADD TO CART — $totalPrice',
                        style: AppStyle.text14Semibold.copyWith(
                          color: ColorsManger.backgroundColor,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
