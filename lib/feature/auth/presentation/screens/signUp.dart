import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubit/auth_state.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/authHeader.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agreed = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    if (!agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the Terms and Privacy Policy'),
        ),
      );
      return;
    }

    await context.read<AuthCubit2>().register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    if (!mounted) return;

    final state = context.read<AuthCubit2>().state;

    if (state is AuthSuccess) {
      Navigator.pushNamed(context, ConstantRoute.VerifyEmail, arguments: email);
    } else if (state is AuthFailure) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

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
                Row(
                  children: [
                    Expanded(
                      child: FormFieldWidget(
                        label: 'First Name',
                        hintText: 'Alexander',
                        controller: firstNameController,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FormFieldWidget(
                        label: 'Last Name',
                        hintText: 'Vance',
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                FormFieldWidget(
                  label: 'Email',
                  hintText: 'alexander.vance@example.com',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                FormFieldWidget(
                  label: 'Password',
                  hintText: '••••••••••••',
                  isPassword: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: agreed,
                      activeColor: const Color(0xFFC2A878),
                      onChanged: (v) {
                        setState(() {
                          agreed = v ?? false;
                        });
                      },
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
                BlocBuilder<AuthCubit2, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : createAccount,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB6A17A),
                          foregroundColor: const Color(0xff3C2E11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Create Account'),
                      ),
                    );
                  },
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
                        Navigator.pushReplacementNamed(
                          context,
                          ConstantRoute.Login,
                        );
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
