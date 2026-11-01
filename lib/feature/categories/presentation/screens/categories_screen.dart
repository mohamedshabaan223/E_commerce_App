import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsManger.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManger.primaryColor,
            size: 20.sp,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Categories',
          style: AppStyle.text18Semibold.copyWith(
            color: ColorsManger.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            CategoryCard(
              imageAsset: 'assets/images/category_watches_large.png',
              title: 'Watches',
              subtitle: 'Horology & Timeless Chronographs',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CategoryCard(
              imageAsset: 'assets/images/category_rings_large.png',
              title: 'Rings',
              subtitle: 'Solid Gold Signets & Fine Bands',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CategoryCard(
              imageAsset: 'assets/images/category_wallets_large.png',
              title: 'Wallets',
              subtitle: 'Handcrafted Calfskin Leather Essentials',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CategoryCard(
              imageAsset: 'assets/images/category_sunglasses_large.png',
              title: 'Sunglasses',
              subtitle: 'Titanium Frames & Polarized Optics',
              onTap: () {},
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
