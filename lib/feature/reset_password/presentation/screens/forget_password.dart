import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/head.dart';
import '../widgets/text_fieled.dart';
import 'otp_verification.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "FORGOT PASSWORD", onPressed: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customhead(
                    title: "Forgot Password",
                    subtitle: "Enter your email, we will send you a code",
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Color(0xff1D1C20),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EMAIL",
                            style: AppStyle.text12Medium.copyWith(
                              color: ColorsManger.white,
                            ),
                          ),
                          CustomTextFormFilled(text: "name@example.com"),
                          CustomFilledButton(
                            text: "SEND CODE",
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                  ) => Verification(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
