import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Onboarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                color: Color(0xff1B1B1D),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffB6A17A).withValues(alpha: .05),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Image.asset("assets/images/luxe_logo.png"),
            ),
            SizedBox(height: 20),
            Text(
              "LUXE",
              style: AppStyle.text25Semibold.copyWith(letterSpacing: 6),
            ),
            SizedBox(height: 10),
            Divider(endIndent: 180, indent: 180),
          ],
        ),
      ),
    );
  }
}
