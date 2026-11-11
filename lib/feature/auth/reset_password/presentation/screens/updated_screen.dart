import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/constant_route.dart';
import '../widgets/filled_button.dart';

class Updated extends StatelessWidget {
  const Updated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70.h,
                height: 70.h,
                decoration: BoxDecoration(
                  color: context.appColors.surface,
                  border: Border.all(
                    color: context.appColors.backgroundColor.withValues(
                      alpha: .40,
                    ),
                    strokeAlign: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.appColors.primaryColor.withValues(alpha: .10),
                      blurRadius: 20,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.check_circle,
                  color: context.appColors.primaryColor,
                  size: 25.h,
                ),
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Text(
                    "Password updated",
                    style: AppStyle.text24Semibold.copyWith(
                      color: context.appColors.white,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Your password has been changed",
                    style: AppStyle.text14Regular.copyWith(
                      color: context.appColors.passwordColor,
                    ),
                  ),
                  Text(
                    "successfully.",
                    style: AppStyle.text14Regular.copyWith(
                      color: context.appColors.passwordColor,
                    ),
                  ),
                  SizedBox(height: 45.h),
                  CustomFilledButton(
                    text: "Back to Login",
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ConstantRoute.Login,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
