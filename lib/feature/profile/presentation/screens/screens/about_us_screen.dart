// feature/profile/presentation/screens/screens/about_us_screen.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/luxe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: context.colors.card,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 16.r,
                        offset: Offset(0, 6.h)),
                  ],
                ),
                child: Text('L',
                    style: AppTheme.heading(
                        size: 40.sp, color: context.colors.gold)),
              ),
              SizedBox(height: 24.h),
              Text('L U X E',
                  style: AppTheme.heading(size: 18.sp).copyWith(
                      fontWeight: FontWeight.w700, letterSpacing: 4)),
              SizedBox(height: 10.h),
              Container(width: 24.w, height: 2.h, color: context.colors.gold),
              SizedBox(height: 24.h),
              Text(
                'LUXE is an accessories store offering watches, rings, '
                'wallets and more. We bring you quality products at fair '
                'prices with fast delivery.',
                textAlign: TextAlign.center,
                style: AppTheme.body(
                    size: 16.sp, color: context.colors.textBody, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}