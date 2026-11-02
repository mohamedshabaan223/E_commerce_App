import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/text_fieled.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "Change Password", onPressed: () {}),
          SizedBox(height: 20.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color(0xff1F1F21),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          CustomPasswordField(text: "CURRENT PASSWORD"),
                          SizedBox(height: 20.h),
                          CustomPasswordField(text: "NEW PASSWORD"),
                          SizedBox(height: 20.h),
                          CustomPasswordField(text: "CONFIRM NEW PASSWORD"),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomFilledButton(
                      text: "Update Password",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
