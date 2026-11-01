// feature/profile/presentation/widgets/widgets/profile_menu_group.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/feature/profile/models/profile_item_model.dart';
import 'package:flutter/material.dart';

import 'profile_menu_tile.dart';

/// A rounded card that holds one or more menu tiles separated by dividers.
class ProfileMenuGroup extends StatelessWidget {
  final List<ProfileItemModel> items;
  const ProfileMenuGroup({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            ProfileMenuTile(
              item: items[i],
              onTap: items[i].destination == null
                  ? null
                  : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => items[i].destination!),
                      ),
            ),
            if (i != items.length - 1)
              Divider(
                  height: 1, thickness: 1, color: context.colors.divider),
          ],
        ],
      ),
    );
  }
}
