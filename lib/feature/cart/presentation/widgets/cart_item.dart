import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem {
  static Widget cartItemDesign({required String image,required String name,required double price}) {
    return Container(
      height: 130,
      padding:  EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: ColorsManger.cartBadgeBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image
              ,
              fit: BoxFit.cover,
            ),
          ),
           SizedBox(width: 16),

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
                        style: TextStyle(
                          color: ColorsManger.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon:  Icon(
                        Icons.delete,
                        color: ColorsManger.passwordColor,
                        size: 15,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
                Text(
                  '\$$price'
                   ,
                  style: TextStyle(
                    color: ColorsManger.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.remove,
                          color: ColorsManger.white,
                          size: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: ColorsManger.white,
                          size: 10,
                        ),
                      ),
                    ],
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
