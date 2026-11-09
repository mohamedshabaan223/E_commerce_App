import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: context.appColors.forTheme(
              const Color(0xFF1E1E21),
              ColorsManger.lightSurface,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.power_settings_new,
                color: context.appColors.forTheme(
                  Colors.white70,
                  ColorsManger.lightTextSecondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Log Out',
                style: TextStyle(
                  color: context.appColors.forTheme(
                    Colors.white,
                    ColorsManger.lightTextPrimary,
                  ),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  color: context.appColors.forTheme(
                    Colors.white70,
                    ColorsManger.lightTextSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.appColors.forTheme(
                      const Color(0xFFC2A878),
                      ColorsManger.lightPrimary,
                    ),
                    foregroundColor: context.appColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  child: const Text('Log Out'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.appColors.forTheme(
                      const Color(0xFF26262A),
                      ColorsManger.lightSurfaceVariant,
                    ),
                    foregroundColor: context.appColors.forTheme(
                      Colors.white,
                      ColorsManger.lightTextPrimary,
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
