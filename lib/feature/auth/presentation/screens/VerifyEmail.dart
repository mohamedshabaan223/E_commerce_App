

import 'dart:async';

import 'package:ecommerce_app/feature/auth/presentation/widgets/custom_otp.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  final String email;

  const VerifyEmail({super.key, required this.email});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

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
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get otp {
    return otpControllers.map((controller) => controller.text).join();
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

    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

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
        title: const Text('VERIFY EMAIL'),
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
            const Text(
              'VERIFY EMAIL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We sent a code to $maskedEmail',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 28),
            CustomOtp(),
            const SizedBox(height: 24),
            SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC2A878),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:  const Text('VERIFY'),
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
                    onPressed: (){},
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
