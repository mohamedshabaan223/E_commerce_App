import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customhead extends StatelessWidget {
  final String title, subtitle;

  const new({super.key, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.text22Medium.copyWith(color: context.appColors.white),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            color: context.appColors.passwordColor,
            fontFamily: null,
          ),
        ),
      ],
    );
  }
}
