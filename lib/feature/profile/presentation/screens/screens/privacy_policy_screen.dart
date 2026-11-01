// feature/profile/presentation/screens/screens/privacy_policy_screen.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/luxe_app_bar.dart';
import 'package:flutter/material.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(title: 'Privacy Policy'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          const _PolicySection(
            title: 'Information we collect',
            text: 'We collect personal details such as your name, email '
                'address, and shipping address when you create an account '
                'or place an order. We also collect basic browsing and '
                'device data to optimize your shopping experience.',
          ),
          const _PolicySection(
            title: 'How we use your data',
            text: 'Your information is used strictly to process orders, '
                'facilitate secure deliveries, and send essential '
                'transaction notices. We never sell your personal data or '
                'share it with unauthorized third parties.',
          ),
          const _PolicySection(
            title: 'Contact us',
            text: 'If you have any questions or inquiries regarding your '
                'privacy, our support team is always available to assist. '
                'Please write to us directly at ',
            link: 'support@luxe-store.com',
            trailing: '.',
          ),
          const SizedBox(height: 8),
          Divider(color: context.colors.divider, thickness: 1),
          const SizedBox(height: 12),
          Text(
            'LAST UPDATED: OCTOBER 2026',
            style: AppTheme.body(
                size: 11,
                color: context.colors.textMuted,
                weight: FontWeight.w600,
                letterSpacing: 1),
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
    final bodyStyle = AppTheme.body(
        size: 16, color: context.colors.textBody, height: 1.5);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTheme.heading(size: 20)),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(style: bodyStyle, children: [
              TextSpan(text: text),
              if (link != null)
                TextSpan(
                    text: link,
                    style: bodyStyle.copyWith(color: context.colors.gold)),
              if (trailing != null) TextSpan(text: trailing),
            ]),
          ),
        ],
      ),
    );
  }
}
