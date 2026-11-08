// feature/profile/presentation/widgets/widgets/profile_menu_group.dart
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/data/models/profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_menu_tile.dart';

/// A rounded card that holds one or more menu tiles separated by dividers.
class ProfileMenuGroup extends StatelessWidget {
  final List<ProfileItemModel> items;
  const ProfileMenuGroup({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: ColorsManger.darkCard,
        borderRadius: BorderRadius.circular(14.r),
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
              const Divider(
                  height: 1, thickness: 1, color: ColorsManger.darkDivider),
          ],
        ],
      ),
    );
  }
}