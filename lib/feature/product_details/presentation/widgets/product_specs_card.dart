import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSpecsCard extends StatelessWidget {
  const ProductSpecsCard({super.key, required this.specs});

  final Map<String, String> specs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: ColorsManger.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: ColorsManger.border),
      ),
      child: Column(
        children: [
          for (final (index, entry) in specs.entries.indexed) ...[
            if (index > 0) SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.key,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.text14Regular.copyWith(
                    color: ColorsManger.textSecondary,
                  ),
                ),
                SizedBox(width: 12.w),
                Flexible(
                  child: Text(
                    entry.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: AppStyle.text14Semibold.copyWith(
                      color: ColorsManger.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
