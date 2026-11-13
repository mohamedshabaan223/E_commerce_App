import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/app_style.dart';

class CustomOtp extends StatelessWidget {
  const CustomOtp({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 55,
    //   height: 60,
    //   textStyle: const TextStyle(
    //     fontSize: 22,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.black,
    //   ),
    //   decoration: BoxDecoration(
    //     color: context.appColors.white,
    //     borderRadius: BorderRadius.circular(12),
    //     border: Border.all(
    //       color: const Color(0xFFD4AF37), // لون ذهبي
    //       width: 1.5,
    //     ),
    //   ),
    // );

    return Center(
      child: Pinput(
        controller: controller,
        cursor: Container(
          width: 2.h,
          height: 20.h,
          color: context.appColors.otpGold,
        ),
        length: 6,
        defaultPinTheme: PinTheme(
          width: 55.h,
          height: 55.h,
          textStyle: AppStyle.text22Semibold.copyWith(
            color: context.appColors.white,
          ),
          decoration: BoxDecoration(
            color: context.appColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
    // Center(
    //   child: Pinput(
    //     length: 6,
    //     defaultPinTheme: defaultPinTheme,
    //
    //     focusedPinTheme: defaultPinTheme.copyWith(
    //       decoration: BoxDecoration(
    //         color: Color(0xffF7F8F9)
    //         ,
    //         borderRadius: BorderRadius.circular(12),
    //         border: Border.all(
    //           color: Colors.amber, // عند التركيز
    //           width: 2,
    //         ),
    //       ),
    //     ),
    //
    //     submittedPinTheme: defaultPinTheme,
    //
    //     separatorBuilder: (index) => const SizedBox(width: 10),
    //
    //     onCompleted: (pin) {
    //       debugPrint("OTP Entered: $pin");
    //     },
    //   ),
    // );
  }
}
