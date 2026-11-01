import 'package:flutter/material.dart';
import '../../../../core/routing/constant_route.dart';
import '../widgets/authHeader.dart';
import '../widgets/form_field.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agreed = false;

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
                  title: 'Create Account',
                  subtitle: 'Create your account to start shopping',
                ),
                const SizedBox(height: 32),
                const Row(
                  children: [
                    Expanded(
                      child: FormFieldWidget(
                        label: 'First Name',
                        hintText: 'Alexander',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: FormFieldWidget(
                        label: 'Last Name',
                        hintText: 'Vance',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const FormFieldWidget(
                  label: 'Email',
                  hintText: 'alexander.vance@example.com',
                ),
                const SizedBox(height: 16),
                const FormFieldWidget(
                  label: 'Password',
                  hintText: '••••••••••••',
                  isPassword: true,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: agreed,
                      activeColor: const Color(0xFFC2A878),
                      onChanged: (v) => setState(() => agreed = v ?? false),
                    ),
                    const Expanded(
                      child: Text(
                        'I agree to the Terms of Service and Privacy Policy',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB6A17A),
                      foregroundColor: Color(0xff3C2E11),
                    ),
                    child: const Text('Create Account'),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, ConstantRoute.Login);
                      },

                      child: const Text(
                        'Login',
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