import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/Cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Cubit/add_to_cart_cubit.dart';
import '../../Cubit/get_cart_cubit.dart';

class CartItem {
  static Widget cartItemDesign({
    required BuildContext context,
    required String image,
    required String name,
    required double price,
    required int quantity,
    required String productId
  }) {

    return Container(
      constraints: const BoxConstraints(minHeight: 140),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: context.appColors.cartBadgeBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                image,
                width: 98,
                height: 98,
                fit: BoxFit.cover
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.appColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: context.appColors.passwordColor,
                        size: 15,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      visualDensity: VisualDensity.compact,
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: context.appColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: context.appColors.forTheme(
                      const Color(0xFF2A2A2A),
                      ColorsManger.lightSurfaceVariant,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),

                  child: BlocListener<AddToCartCubit, CartState>(
                    listener: (context, state) {
                      if (state is AddToCartSuccessState) {
                        context.read<GetCartCubit>().getCart();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        GestureDetector(
                          onTap: () {
                            if (quantity > 1) {
                              context.read<AddToCartCubit>().addToCart(
                                productId: productId,
                                quantity: -1,
                              );
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            color: context.appColors.white,
                            size: 20,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "$quantity",
                            style: TextStyle(
                              color: context.appColors.forTheme(
                                Colors.white,
                                ColorsManger.lightTextPrimary,
                              ),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AddToCartCubit>().addToCart(
                              productId: productId,
                              quantity: 1,
                            );
                          },
                          child: Icon(
                            Icons.add,
                            color: context.appColors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}