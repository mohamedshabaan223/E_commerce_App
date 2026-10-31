import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.hint = 'Search products',
    this.controller,
    this.onChanged,
    this.onTap,
    this.onClear,
    this.readOnly = false,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onClear;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManger.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: ColorsManger.surface,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 16.sp, color: ColorsManger.primaryColor),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              readOnly: readOnly,
              style: TextStyle(
                color: ColorsManger.textPrimary,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: ColorsManger.textSecondary,
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14.h),
              ),
            ),
          ),
          if (onClear != null)
            GestureDetector(
              onTap: onClear,
              child: Icon(
                Icons.close,
                size: 16.sp,
                color: ColorsManger.textSecondary,
              ),
            ),
        ],
      ),
    );
  }
}
