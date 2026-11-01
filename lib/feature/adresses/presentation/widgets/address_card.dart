import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard {
  static Widget addressCardDesign({
    required IconData? icon,
    required String city,
    required String state,
    required String suite,
    required String street,
    required String phone,
    required String notes,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: ColorsManger.cartBadgeBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:  EdgeInsets.all(15),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: ColorsManger.white, size: 15),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorsManger.border,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: ColorsManger.white,
                        size: 15,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorsManger.border,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: ColorsManger.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            RichText(
              text: TextSpan(
                style: TextStyle(color: ColorsManger.white, fontSize: 24),
                children: [
                  TextSpan(
                    text: city,
                    style: TextStyle(
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: state,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManger.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Text(
                  street,
                  style: TextStyle(
                    color: ColorsManger.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorsManger.border,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    suite,
                    style: TextStyle(
                      color: ColorsManger.primaryColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  color: ColorsManger.primaryColor,
                  size: 13,
                ),
                SizedBox(width: 10),
                Text(
                  phone,
                  style: TextStyle(
                    color: ColorsManger.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Icon(
                  Icons.sticky_note_2_outlined,
                  color: ColorsManger.primaryColor,
                  size: 13,
                ),
                SizedBox(width: 10),
                Text(
                  notes,
                  style: TextStyle(
                    color: ColorsManger.textSecondary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
