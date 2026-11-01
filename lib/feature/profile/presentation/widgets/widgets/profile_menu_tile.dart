// feature/profile/presentation/widgets/widgets/profile_menu_tile.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/models/profile_item_model.dart';
import 'package:flutter/material.dart';

import 'icon_box.dart';

class ProfileMenuTile extends StatelessWidget {
  final ProfileItemModel item;
  final VoidCallback? onTap;

  const ProfileMenuTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textColor = item.isDanger ? context.colors.danger : context.colors.textPrimary;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconBox(
              icon: item.icon,
              color: item.isDanger ? context.colors.danger : context.colors.gold,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item.title,
                style: AppTheme.body(
                    size: 16, color: textColor, weight: FontWeight.w500),
              ),
            ),
            if (item.badge != null)
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: context.colors.iconBox,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.badge!,
                  style: AppTheme.body(
                      size: 10,
                      color: context.colors.gold,
                      weight: FontWeight.w600,
                      letterSpacing: 0.8),
                ),
              ),
            Icon(Icons.chevron_right_rounded,
                color: context.colors.textMuted, size: 22),
          ],
        ),
      ),
    );
  }
}
