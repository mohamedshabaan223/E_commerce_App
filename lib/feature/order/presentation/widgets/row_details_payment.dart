import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowDetailsPayment extends StatelessWidget {
  const RowDetailsPayment({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.appColors.backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.text10Semibold.copyWith(
              color: context.appColors.forTheme(
                const Color(0xffC7B99D),
                ColorsManger.lightTextSecondary,
              ),
            ),
          ),
          Text(
            subTitle,
            style: AppStyle.text10Semibold.copyWith(
              color: context.appColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
