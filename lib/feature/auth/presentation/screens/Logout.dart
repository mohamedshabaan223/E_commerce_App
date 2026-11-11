import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: context.appColors.backgroundColor,
            body: Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.appColors.forTheme(
                    const Color(0xFF1E1E21),
                    ColorsManger.lightSurface,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      color: context.appColors.forTheme(
                        Colors.white70,
                        ColorsManger.lightTextSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        color: context.appColors.forTheme(
                          Colors.white,
                          ColorsManger.lightTextPrimary,
                        ),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        color: context.appColors.forTheme(
                          Colors.white70,
                          ColorsManger.lightTextSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
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
                            Navigator.pop(context); // يقفل الـ loading dialog
                            Fluttertoast.showToast(
                              msg: "Logged Out Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: context.appColors.primaryColor,
                              textColor: context.appColors.forTheme(
                                Colors.white,
                                ColorsManger.lightTextPrimary,
                              ),
                              fontSize: 16.0,
                            );
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              ConstantRoute.Login,
                              (route) => false,
                            );
                          } else if (state is AuthErrorState) {
                            Navigator.pop(context); // يقفل الـ loading dialog
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
                          }
                        },
                        child: ElevatedButton(
                          onPressed: () => context.read<AuthCubit>().logOut(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.appColors.forTheme(
                              const Color(0xFFC2A878),
                              ColorsManger.lightPrimary,
                            ),
                            foregroundColor: context.appColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Log Out'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.appColors.forTheme(
                            const Color(0xFF26262A),
                            ColorsManger.lightSurfaceVariant,
                          ),
                          foregroundColor: context.appColors.forTheme(
                            Colors.white,
                            ColorsManger.lightTextPrimary,
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}