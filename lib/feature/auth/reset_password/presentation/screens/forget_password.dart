import 'package:ecommerce_app/core/helper/validator_app.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/forget_password_cubit.dart';
import '../cubit/forget_password_state.dart';
import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/head.dart';
import '../widgets/text_fieled.dart';
import 'otp_verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> mykey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        backgroundColor: context.appColors.backgroundColor,
        body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP sent successfully')),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => OtpCubit()),
                      BlocProvider(create: (context) => AuthCubit()),
                    ],
                    child: Verification(email: emailController.text.trim()),
                  ),
                ),
              );
            }
            if (state is ForgotPasswordError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: "FORGOT PASSWORD",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Customhead(
                            title: "Forgot Password",
                            subtitle:
                                "Enter your email, we will send you a code",
                          ),
                          SizedBox(height: 32.h),
                          Container(
                            width: double.infinity,
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: context.appColors.surface,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0.r),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "EMAIL",
                                    style: AppStyle.text12Medium.copyWith(),
                                  ),
                                  Form(
                                    key: mykey,
                                    child: CustomTextFormFilled(
                                      text: "name@example.com",
                                      controller: emailController,
                                      validator: ValidatorApp.validateEmail,
                                    ),
                                  ),
                                  if (state is ForgotPasswordLoading)
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: context.appColors.primaryColor,
                                      ),
                                    )
                                  else
                                    CustomFilledButton(
                                      text: "SEND CODE",
                                      onPressed: () {
                                        if (mykey.currentState!.validate()) {
                                          final email = emailController.text
                                              .trim();

                                          context
                                              .read<ForgotPasswordCubit>()
                                              .forgotPassword(email);
                                        }
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
