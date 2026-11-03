import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/Login.dart';
import 'package:ecommerce_app/feature/reset_password/presentation/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              ". LUXE",
              style: AppStyle.text18Semibold.copyWith(
                letterSpacing: 2,
                color: ColorsManger.primaryColor,
              ),
            ),
            Spacer(),
            currentPage < images.length - 1
                ? TextButton(
                    onPressed: () {},
                    child: Text(
                      "skip",
                      style: AppStyle.text14Medium.copyWith(
                        color: ColorsManger.primaryColor,
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
          mainAxisAlignment: .start,
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
            SizedBox(height: 100),
            Text(text[currentPage], style: AppStyle.text22Medium),
            SizedBox(height: 10),
            Text(
              text2[currentPage],
              style: AppStyle.text14Regular.copyWith(
                color: ColorsManger.primaryColor,
              ),
            ),
            SizedBox(height: 100),

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
                    color: ColorsManger.primaryColor,
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
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Login(),
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
