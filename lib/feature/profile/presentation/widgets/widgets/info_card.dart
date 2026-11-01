// feature/profile/presentation/widgets/widgets/info_card.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'icon_box.dart';

/// Card used in the Contact Us screen: icon + small label + content.
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget content;
  final String? tag;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.content,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconBox(icon: icon, size: 48, iconSize: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: AppTheme.body(
                          size: 10,
                          color: context.colors.textSecondary,
                          weight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                    if (tag != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: context.colors.iconBox,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(tag!,
                            style: AppTheme.body(
                                size: 10,
                                color: context.colors.textSecondary,
                                weight: FontWeight.w600)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
