import 'dart:async';

import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/custom_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class VerifyEmail extends StatefulWidget {
  final String email;

  const VerifyEmail({super.key, required this.email});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final TextEditingController otpcontroller = TextEditingController();
  Timer? timer;
  int remainingSeconds = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      remainingSeconds = 30;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  String get maskedEmail {
    final parts = widget.email.split('@');

    if (parts.length != 2) return widget.email;

    final name = parts[0];

    if (name.length <= 1) {
      return '***@${parts[1]}';
    }

    return '${name[0]}***@${parts[1]}';
  }

  @override
  void dispose() {
    timer?.cancel();
    otpcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141416),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141416),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'VERIFY EMAIL',
          style: AppStyle.text20Semibold.copyWith(letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF26262A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.mark_email_read_outlined,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'VERIFY EMAIL',
              style: AppStyle.text18Semibold.copyWith(letterSpacing: 2),
            ),
            const SizedBox(height: 8),
            Text(
              'We sent a code to $maskedEmail',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 28),
            CustomOtp(controller: otpcontroller),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email verified successfully!'),
                      ),
                    );
                  }
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is AuthLoadingState
                        ? null
                        : () {
                            final otp = otpcontroller.text.trim();

                            if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter a valid 6-digit OTP',
                                  ),
                                ),
                              );
                              return;
                            }

                            context.read<AuthCubit>().verifyEmail(
                              email: widget.email,
                              otp: otp,
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC2A878),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: state is AuthLoadingState
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text('VERIFY'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  remainingSeconds > 0
                      ? 'Resend code in $formattedTime'
                      : 'Didn\'t receive the code? ',
                  style: const TextStyle(color: Colors.white70),
                ),
                if (remainingSeconds == 0)
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend OTP',
                      style: TextStyle(color: Color(0xFFC2A878)),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
