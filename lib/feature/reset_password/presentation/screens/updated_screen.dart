import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/filled_button.dart';

class Updated extends StatelessWidget {
  const Updated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.h,
                height: 70.h,
                decoration: BoxDecoration(
                  color: Color(0xff1D1C20),
                  border: Border.all(
                    color: Color(0xff242226).withValues(alpha: .40),
                    strokeAlign: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManger.primaryColor.withValues(alpha: .10),
                      blurRadius: 20,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManger.primaryColor,
                  size: 25.h,
                ),
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Text(
                    "Password updated",
                    style: AppStyle.text22Semibold.copyWith(
                      color: ColorsManger.white,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Your password has been changed",
                    style: AppStyle.text14Regular.copyWith(
                      color: ColorsManger.passwordColor,
                    ),
                  ),
                  Text(
                    "successfully.",
                    style: AppStyle.text14Regular.copyWith(
                      color: ColorsManger.passwordColor,
                    ),
                  ),
                  SizedBox(height: 45.h),
                  CustomFilledButton(text: "Back to Login"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
