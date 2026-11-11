import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: context.appColors.inputFill,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'L',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: context.appColors.primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -8,
              bottom: -8,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: context.appColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.star, size: 14, color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: context.appColors.forTheme(
              Colors.white,
              ColorsManger.lightTextPrimary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: context.appColors.forTheme(
              Colors.white70,
              ColorsManger.lightTextSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
