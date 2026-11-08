import 'dart:async';

import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/cubit/otp_cubit.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/cubit/otp_state.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/utils/colors_manger.dart';
import '../cubit/resetpassword_cubit.dart';
import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';
import '../widgets/head.dart';

class Verification extends StatefulWidget {
  final String email;
  const Verification({super.key, required this.email});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController otpcontroller = TextEditingController();
  int secondsRemaining = 30;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    _startInitialTimer();
  }

  void _startInitialTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _restartTimer() {
    countdownTimer?.cancel();

    setState(() {
      secondsRemaining = 30;
    });

    _startInitialTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    otpcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      body: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    BlocProvider(
                      create: (context) => ResetPasswordCubit(),
                      child: ResetPassword(
                        email: widget.email,
                        otp: otpcontroller.text,
                      ),
                    ),
              ),
            );
          }
          if (state is OtpError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: "OTP VERIFICATION",
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
                          title: "Verification",
                          subtitle: "We sent a code to  ${widget.email}",
                        ),
                        SizedBox(height: 45.h),
                        Center(
                          child: Pinput(
                            controller: otpcontroller,
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
                          ),
                        ),
                        SizedBox(height: 50.h),
                        if (state is OtpLoading)
                          const Center(
                            child: CircularProgressIndicator(
                              color: ColorsManger.primaryColor,
                            ),
                          )
                        else
                          CustomFilledButton(
                            text: "VERIFY",
                            onPressed: () {
                              if (state is OtpLoading) return;
                              if (otpcontroller.text.length != 6) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please enter the complete OTP",
                                    ),
                                  ),
                                );
                                return;
                              }

                              context.read<OtpCubit>().verifyOtp(
                                email: widget.email,
                                otp: otpcontroller.text,
                              );
                            },
                          ),
                        SizedBox(height: 20.h),
                        BlocListener<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthSuccessState) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('')));

                              _restartTimer();
                            }

                            if (state is AuthErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)),
                              );
                            }
                          },
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, resendState) {
                              final isLoading = resendState is AuthLoadingState;

                              return Center(
                                child: TextButton(
                                  onPressed: secondsRemaining > 0 || isLoading
                                      ? null
                                      : () {
                                          context.read<AuthCubit>().resendOtp(
                                            email: widget.email,
                                          );
                                        },
                                  child: Text(
                                    isLoading
                                        ? "Sending..."
                                        : secondsRemaining > 0
                                        ? "Resend code in 00:${secondsRemaining.toString().padLeft(2, '0')}"
                                        : "Resend OTP",
                                    style: AppStyle.text12Medium.copyWith(
                                      color: secondsRemaining > 0
                                          ? Colors.grey
                                          : ColorsManger.primaryColor,
                                    ),
                                  ),
                                ),
                              );
                            },
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
    );
  }
}
