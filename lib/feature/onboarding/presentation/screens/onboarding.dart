import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/reset_password/presentation/widgets/filled_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final images = [
    "assets/images/category_watches.png",
    "assets/images/promo_banner.png",
    "assets/images/category_rings.png",
  ];
  final text = ["Discover", "Exclusive Offers", "Fast Delivery"];
  final text2 = [
    "Watches, rings, wallets and more",
    "Grab daily deals and discounts",
    "Order easily and track your orders",
  ];
  int currentPage = 0;
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.appColors.backgroundColor,
        title: Row(
          children: [
            Text(
              ". LUXE",
              style: AppStyle.text18Semibold.copyWith(
                letterSpacing: 2,
                color: context.appColors.primaryColor,
              ),
            ),
            Spacer(),
            currentPage < images.length - 1
                ? TextButton(
                    onPressed: () {},
                    child: Text(
                      "skip",
                      style: AppStyle.text14Medium.copyWith(
                        color: context.appColors.primaryColor,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 250.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.asset(images[currentPage], fit: BoxFit.cover),
              ),
            ),
            // SizedBox(height: 100),
            Column(
              children: [
                Text(text[currentPage], style: AppStyle.text22Medium),
                SizedBox(height: 10),
                Text(
                  text2[currentPage],
                  style: AppStyle.text14Regular.copyWith(
                    color: context.appColors.primaryColor,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                bool isActive = currentPage == index;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: isActive ? 24 : 6,
                  decoration: BoxDecoration(
                    color: context.appColors.primaryColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            CustomFilledButton(
              text: currentPage < images.length - 1 ? "NEXT" : "GET STARTED",
              onPressed: () {
                if (currentPage < images.length - 1) {
                  setState(() {
                    currentPage++;
                  });
                } else {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          BlocProvider(
                            create: (context) => AuthCubit(),
                            child: Login(),
                          ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
