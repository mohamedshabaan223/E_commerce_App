import 'package:ecommerce_app/core/helper/validator_app.dart';
import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/data/models/login_request.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/authHeader.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/form_field.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/screens/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
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
                fillColor: context.appColors.forTheme(
                  const Color(0xFF26262A),
                  ColorsManger.lightSurfaceVariant,
                ),
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
                    title: 'Welcome Back',
                    subtitle: 'Log in to your account',
                  ),
                  const SizedBox(height: 40),
                  FormFieldWidget(
                    controller: email,
                    validator: ValidatorApp.validateEmail,
                    label: 'Email address',
                    hintText: 'client@domain.com',
                  ),
                  const SizedBox(height: 16),
                  FormFieldWidget(
                    controller: password,
                    validator: ValidatorApp.validatePassword,
                    label: 'Password',
                    hintText: '••••••••••••',
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                            ) => ForgetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: context.appColors.forTheme(
                            const Color(0xFFC2A878),
                            ColorsManger.lightPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoadingState) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => Center(
                              child: CircularProgressIndicator(
                                color: context.appColors.primaryColor,
                              ),
                            ),
                          );
                        } else if (state is AuthSuccessState) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "Login Successfuly",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            textColor: context.appColors.forTheme(
                              Colors.white,
                              ColorsManger.lightTextPrimary,
                            ),
                            fontSize: 16.0,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            ConstantRoute.mainScreen,
                          );
                        } else if (state is AuthErrorState) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: context.appColors.forTheme(
                              Colors.white,
                              ColorsManger.lightTextPrimary,
                            ),
                            fontSize: 16.0,
                          );
                        } else {
                          SizedBox.shrink();
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signIn(
                              LoginRequest(
                                email: email.text,
                                password: password.text,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.appColors.primaryColor,
                          foregroundColor: context.appColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.appColors.forTheme(
                          const Color(0xff343136),
                          ColorsManger.lightSurfaceVariant,
                        ),
                        foregroundColor: context.appColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: const Text('Continue with Google'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: context.appColors.forTheme(
                            Colors.white70,
                            ColorsManger.lightTextSecondary,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ConstantRoute.SignUp);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: context.appColors.forTheme(
                              const Color(0xFFC2A878),
                              ColorsManger.lightPrimary,
                            ),
                          ),
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
