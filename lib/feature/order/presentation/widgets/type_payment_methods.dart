import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TypePaymentMethods extends StatelessWidget {
  const TypePaymentMethods({
    super.key,
    required this.label,
    required this.icon,
    required this.icoColor,
    required this.iconPath,
    required this.selectedType,
  });
  final String label;
  final IconData icon;
  final Color icoColor;
  final String iconPath;
  final PaymentTypeMethods selectedType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.r, vertical: 17.r),
      decoration: BoxDecoration(
        color: context.appColors.cardSurface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(width: 10.w),
          Text(
            label,
            style: AppStyle.text14Medium.copyWith(
              color: context.appColors.white,
            ),
          ),
          Spacer(),
          Icon(icon, color: icoColor),
        ],
      ),
    );
  }
}
