import 'package:ecommerce_app/core/helper/validator_app.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/form_field.dart'
    show FormFieldWidget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/app_bar.dart';
import '../widgets/filled_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: context.appColors.backgroundColor,
          body: Form(
            key: formKey,
            child: Column(
              children: [
                CustomAppBar(
                  title: "Change Password",
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                        child: Column(
                          children: [
                            FormFieldWidget(
                              controller: currentPassword,
                              validator: (pass) {
                                return ValidatorApp.validatePassword(pass!);
                              },
                              label: 'CURRENT PASSWORD',
                              hintText: 'CURRENT PASSWORD',
                              isPassword: true,
                            ),
                            SizedBox(height: 20.h),
                            FormFieldWidget(
                              controller: newPassword,
                              validator: (pass) {
                                return ValidatorApp.validatePassword(pass!);
                              },
                              label: 'NEW PASSWORD',
                              hintText: 'NEW PASSWORD',
                              isPassword: true,
                            ),
                            SizedBox(height: 20.h),
                            FormFieldWidget(
                              controller: confirmPassword,
                              validator: (v) => v != newPassword.text
                                  ? 'Passwords do not match'
                                  : null,
                              label: 'CONFIRM PASSWORD',
                              hintText: 'CONFIRM PASSWORD',
                              isPassword: true,
                            ),
                            SizedBox(height: 40.h),
                            BlocListener<AuthCubit, AuthState>(
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
                                  Navigator.pop(context); // يقفل الـ dialog
                                  Fluttertoast.showToast(
                                    msg: "Password has been changed successfully.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        context.appColors.primaryColor,
                                    textColor: context.appColors.forTheme(
                                      Colors.white,
                                      ColorsManger.lightTextPrimary,
                                    ),
                                    fontSize: 16.0,
                                  );
                                } else if (state is AuthErrorState) {
                                  Navigator.pop(context); // يقفل الـ dialog
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
                              child: CustomFilledButton(
                                text: "Update Password",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().changPassword(
                                      currentPassword: currentPassword.text,
                                      newPassword: newPassword.text,
                                      confirmNewPassword: confirmPassword.text,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
