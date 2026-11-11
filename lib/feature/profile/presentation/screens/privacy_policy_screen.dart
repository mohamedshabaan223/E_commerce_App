// feature/profile/presentation/screens/screens/privacy_policy_screen.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/lustre_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.darkBackground,
      appBar: const LUSTREAppBar(title: 'Privacy Policy'),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
        children: [
          const _PolicySection(
            title: 'Information we collect',
            text:
                'We collect personal details such as your name, email '
                'address, and shipping address when you create an account '
                'or place an order. We also collect basic browsing and '
                'device data to optimize your shopping experience.',
          ),
          const _PolicySection(
            title: 'How we use your data',
            text:
                'Your information is used strictly to process orders, '
                'facilitate secure deliveries, and send essential '
                'transaction notices. We never sell your personal data or '
                'share it with unauthorized third parties.',
          ),
          const _PolicySection(
            title: 'Contact us',
            text:
                'If you have any questions or inquiries regarding your '
                'privacy, our support team is always available to assist. '
                'Please write to us directly at ',
            link: 'support@LUSTRE-store.com',
            trailing: '.',
          ),
          SizedBox(height: 8.h),
          Divider(color: context.appColors.darkDivider, thickness: 1),
          SizedBox(height: 12.h),
          Text(
            'LAST UPDATED: OCTOBER 2026',
            style: AppStyle.text11Semibold.copyWith(
              color: context.appColors.darkTextMuted,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _PolicySection extends StatelessWidget {
  final String title;
  final String text;
  final String? link;
  final String? trailing;

  const _PolicySection({
    required this.title,
    required this.text,
    this.link,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final bodyStyle = AppStyle.text16Regular.copyWith(
      color: context.appColors.darkTextBody,
      height: 1.5,
    );
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.text20Semibold.copyWith(
              color: context.appColors.darkTextPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text.rich(
            TextSpan(
              style: bodyStyle,
              children: [
                TextSpan(text: text),
                if (link != null)
                  TextSpan(
                    text: link,
                    style: bodyStyle.copyWith(
                      color: context.appColors.darkGold,
                    ),
                  ),
                if (trailing != null) TextSpan(text: trailing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
