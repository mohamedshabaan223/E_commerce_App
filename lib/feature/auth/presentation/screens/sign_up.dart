import 'package:ecommerce_app/core/helper/validator_app.dart';
import 'package:ecommerce_app/core/network/api_constatnt.dart';
import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/auth_header.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/models/register_request.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agreed = false;
  bool isLoadingDialogOpen = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: context.appColors.inputFill,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            child: Form(
              key: formKey,
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
                          validator: ValidatorApp.validateName,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FormFieldWidget(
                          label: 'Last Name',
                          hintText: 'Vance',
                          controller: lastNameController,
                          validator: ValidatorApp.validateName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FormFieldWidget(
                    validator: ValidatorApp.validateEmail,
                    label: 'Email',
                    hintText: 'alexander.vance@example.com',
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  FormFieldWidget(
                    validator: (pass) {
                      return ValidatorApp.validatePassword(pass!);
                    },
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
                        activeColor: context.appColors.brightGold,
                        onChanged: (v) {
                          setState(() {
                            agreed = v ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms of Service and Privacy Policy',
                          style: TextStyle(
                            color: context.appColors.forTheme(
                              Colors.white70,
                              context.appColors.textSecondary,
                            ),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoadingState) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (dialogContext) => Center(
                              child: CircularProgressIndicator(
                                color: dialogContext.appColors.primaryColor,
                              ),
                            ),
                          );
                        } else if (state is AuthSuccessState) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: ApiConstatnt.registerResponseMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: context.appColors.primaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            ConstantRoute.verifyEmail,
                            arguments: emailController.text.trim(),
                          );
                        } else if (state is AuthErrorState) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          SizedBox.shrink();
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signUp(
                              RegisterRequest(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.appColors.primaryColor,
                          foregroundColor: context.appColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Create Account'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: context.appColors.forTheme(
                            Colors.white70,
                            context.appColors.textSecondary,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            ConstantRoute.login,
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: context.appColors.brightGold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
