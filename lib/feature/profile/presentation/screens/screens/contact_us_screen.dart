// feature/profile/presentation/screens/screens/contact_us_screen.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/info_card.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/luxe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(title: 'Contact Us'),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
        children: [
          InfoCard(
            icon: Icons.mail_outline_rounded,
            label: 'EMAIL',
            content: Text('support@luxe-store.com',
                style: AppTheme.body(size: 15.sp)),
          ),
          InfoCard(
            icon: Icons.phone_outlined,
            label: 'PHONE',
            content:
                Text('+1 (800) 589-3290', style: AppTheme.body(size: 15.sp)),
          ),
          InfoCard(
            icon: Icons.location_on_outlined,
            label: 'ADDRESS',
            content: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                '450 5th Avenue, Suite 1800, New York, NY 10018',
                style: AppTheme.body(size: 15.sp, height: 1.6),
              ),
            ),
          ),
          InfoCard(
            icon: Icons.access_time_rounded,
            label: 'WORKING HOURS',
            tag: 'EST',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Monday – Friday',
                    style:
                        AppTheme.body(size: 15.sp, weight: FontWeight.w500)),
                SizedBox(height: 4.h),
                Text('9:00 AM – 6:00 PM EST',
                    style: AppTheme.body(
                        size: 14.sp, color: context.colors.textSecondary)),
                SizedBox(height: 14.h),
                Text('Saturday',
                    style:
                        AppTheme.body(size: 15.sp, weight: FontWeight.w500)),
                SizedBox(height: 4.h),
                Text('10:00 AM – 4:00 PM EST',
                    style: AppTheme.body(
                        size: 14.sp, color: context.colors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}