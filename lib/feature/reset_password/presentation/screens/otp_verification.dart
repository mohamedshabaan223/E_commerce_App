import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/feature/reset_password/presentation/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/colors_manger.dart';
import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/head.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "OTP VERIFICATION", onPressed: () {}),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customhead(
                      title: "Verification",
                      subtitle: "We sent a code to a***@gmail.com",
                    ),
                    SizedBox(height: 45.h),
                    Center(
                      child: Pinput(
                        cursor: Container(
                          width: 2.h,
                          height: 20.h,
                          color: Color(0xffDAC49B),
                        ),
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: 55.h,
                          height: 55.h,
                          textStyle: AppStyle.text22Semibold.copyWith(
                            color: ColorsManger.white,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff1D1C20),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onCompleted: (value) {
                          print(value);
                        },
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomFilledButton(
                      text: "VERIFY",
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                            ) => ResetPassword(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Resend code in 00:30",
                          style: AppStyle.text12Medium.copyWith(
                            color: ColorsManger.primaryColor,
                          ),
                        ),
                      ),
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
