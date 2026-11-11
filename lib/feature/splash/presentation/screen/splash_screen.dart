import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final token = await SecureStorageCacheing().getAccessToken();
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        token == null ? ConstantRoute.onboarding : ConstantRoute.mainScreen,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                color: context.appColors.cardSurface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: context.appColors.primaryColor.withValues(
                      alpha: .05,
                    ),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Image.asset("assets/images/lustre_logo.png"),
            ),
            SizedBox(height: 20),
            Text(
              "LUSTRE",
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
