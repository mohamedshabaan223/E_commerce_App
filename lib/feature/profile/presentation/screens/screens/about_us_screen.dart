// feature/profile/presentation/screens/screens/about_us_screen.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/luxe_app_bar.dart';
import 'package:flutter/material.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(title: 'About Us'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 112,
                height: 112,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colors.card,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 16,
                        offset: Offset(0, 6)),
                  ],
                ),
                child: Text('L',
                    style: AppTheme.heading(size: 40, color: context.colors.gold)),
              ),
              const SizedBox(height: 24),
              Text('L U X E',
                  style: AppTheme.heading(size: 18).copyWith(
                      fontWeight: FontWeight.w700, letterSpacing: 4)),
              const SizedBox(height: 10),
              Container(width: 24, height: 2, color: context.colors.gold),
              const SizedBox(height: 24),
              Text(
                'LUXE is an accessories store offering watches, rings, '
                'wallets and more. We bring you quality products at fair '
                'prices with fast delivery.',
                textAlign: TextAlign.center,
                style: AppTheme.body(
                    size: 16, color: context.colors.textBody, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
