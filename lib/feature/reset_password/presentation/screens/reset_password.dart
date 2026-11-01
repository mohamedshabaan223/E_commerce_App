import 'package:ecommerce_app/feature/reset_password/presentation/screens/updated_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors_manger.dart';
import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/head.dart';
import '../widgets/text_fieled.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: "RESET PASSWORD",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                      title: "Reset Password",
                      subtitle: "Enter your new password below",
                    ),
                    SizedBox(height: 30.h),
                    CustomPasswordField(text: "New Password"),
                    SizedBox(height: 22.h),
                    CustomPasswordField(text: "Confirm Password"),
                    SizedBox(height: 38.h),
                    CustomFilledButton(
                      text: "RESET PASSWORD",
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                            ) => Updated(),
                          ),
                        );
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
