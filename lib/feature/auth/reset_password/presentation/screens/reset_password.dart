import 'package:ecommerce_app/core/helper/validator_app.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/cubit/resetpassword_state.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/screens/updated_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors_manger.dart';
import '../cubit/resetpassword_cubit.dart';
import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/head.dart';
import '../widgets/text_fieled.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  final String otp;
  const ResetPassword({super.key, required this.email, required this.otp});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> mykey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Updated()),
          );
        }
        if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.appColors.backgroundColor,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.0.w,
                      vertical: 50.h,
                    ),
                    child: Form(
                      key: mykey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Customhead(
                            title: "Reset Password",
                            subtitle: "Enter your new password below",
                          ),
                          SizedBox(height: 30.h),
                          CustomPasswordField(
                            index: 1,
                            text: "New Password",
                            controller: newPasswordController,
                            validator: (pass) {
                              return ValidatorApp.validatePassword2(pass!);
                            },
                          ),

                          SizedBox(height: 22.h),
                          CustomPasswordField(
                            index: 2,
                            text: "Confirm Password",
                            controller: confirmPasswordController,
                            validator: (pass) {
                              return ValidatorApp.confirmPassword(
                                pass!,
                                newPasswordController.text,
                              );
                            },
                          ),

                          SizedBox(height: 38.h),
                          if (state is ResetPasswordLoading)
                            Center(
                              child: CircularProgressIndicator(
                                color: context.appColors.primaryColor,
                              ),
                            )
                          else
                            CustomFilledButton(
                              text: "RESET PASSWORD",
                              onPressed: () {
                                if (mykey.currentState!.validate()) {
                                  final password = newPasswordController.text
                                      .trim();

                                  context
                                      .read<ResetPasswordCubit>()
                                      .resetPassword(
                                        email: widget.email,
                                        otp: widget.otp,
                                        newPassword: password,
                                      );
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
