// feature/profile/presentation/screens/screens/contact_us_screen.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/info_card.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/luxe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final valueStyle = AppStyle.text15Regular.copyWith(
      color: context.appColors.darkTextPrimary,
    );
    final dayStyle = AppStyle.text15Medium.copyWith(
      color: context.appColors.darkTextPrimary,
    );
    final hoursStyle = AppStyle.text14Regular.copyWith(
      color: context.appColors.darkTextSecondary,
    );

    return Scaffold(
      backgroundColor: context.appColors.darkBackground,
      appBar: const LuxeAppBar(title: 'Contact Us'),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
        children: [
          InfoCard(
            icon: Icons.mail_outline_rounded,
            label: 'EMAIL',
            content: Text('support@luxe-store.com', style: valueStyle),
          ),
          InfoCard(
            icon: Icons.phone_outlined,
            label: 'PHONE',
            content: Text('+1 (800) 589-3290', style: valueStyle),
          ),
          InfoCard(
            icon: Icons.location_on_outlined,
            label: 'ADDRESS',
            content: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                '450 5th Avenue, Suite 1800, New York, NY 10018',
                style: valueStyle.copyWith(height: 1.6),
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
                Text('Monday – Friday', style: dayStyle),
                SizedBox(height: 4.h),
                Text('9:00 AM – 6:00 PM EST', style: hoursStyle),
                SizedBox(height: 14.h),
                Text('Saturday', style: dayStyle),
                SizedBox(height: 4.h),
                Text('10:00 AM – 4:00 PM EST', style: hoursStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
