// feature/profile/presentation/widgets/widgets/profile_menu_tile.dart
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/data/models/profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_box.dart';

class ProfileMenuTile extends StatelessWidget {
  final ProfileItemModel item;
  final VoidCallback? onTap;

  const ProfileMenuTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textColor =
        item.isDanger ? ColorsManger.darkDanger : ColorsManger.darkTextPrimary;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            IconBox(
              icon: item.icon,
              color: item.isDanger
                  ? ColorsManger.darkDanger
                  : ColorsManger.darkGold,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                item.title,
                style: AppStyle.text16Medium.copyWith(color: textColor),
              ),
            ),
            if (item.badge != null)
              Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: ColorsManger.darkIconBox,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  item.badge!,
                  style: AppStyle.text10Semibold.copyWith(
                    color: ColorsManger.darkGold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            Icon(Icons.chevron_right_rounded,
                color: ColorsManger.darkTextMuted, size: 22.sp),
          ],
        ),
      ),
    );
  }
}