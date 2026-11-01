import 'package:flutter/material.dart';
import '../../../../core/routing/constant_route.dart';
import '../widgets/authHeader.dart';
import '../widgets/form_field.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141416),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Theme(
            data: ThemeData.dark().copyWith(
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: const Color(0xFF26262A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const AuthHeader(
                  title: 'Welcome Back',
                  subtitle: 'Log in to your account',
                ),
                const SizedBox(height: 40),
                const FormFieldWidget(
                  label: 'Email address',
                  hintText: 'client@domain.com',
                ),
                const SizedBox(height: 16),
                const FormFieldWidget(
                  label: 'Password',
                  hintText: '••••••••••••',
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xFFC2A878)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB6A17A),
                      foregroundColor: Color(0xff3C2E11),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff343136),
                      foregroundColor: Color(0xffB6A17A),
                    ),
                    child: const Text('Continue with Google'),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, ConstantRoute.SignUp);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xFFC2A878)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}