// feature/profile/presentation/screens/screens/about_us_screen.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/luxe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.darkBackground,
      appBar: const LuxeAppBar(title: 'About Us'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 112.w,
                height: 112.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsManger.darkCard,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 16.r,
                        offset: Offset(0, 6.h)),
                  ],
                ),
                child: Text(
                  'L',
                  style: AppStyle.text40Semibold.copyWith(
                    color: ColorsManger.darkGold,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'L U X E',
                style: AppStyle.text18Semibold.copyWith(
                  color: ColorsManger.darkTextPrimary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                  width: 24.w, height: 2.h, color: ColorsManger.darkGold),
              SizedBox(height: 24.h),
              Text(
                'LUXE is an accessories store offering watches, rings, '
                'wallets and more. We bring you quality products at fair '
                'prices with fast delivery.',
                textAlign: TextAlign.center,
                style: AppStyle.text16Regular.copyWith(
                  color: ColorsManger.darkTextBody,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}