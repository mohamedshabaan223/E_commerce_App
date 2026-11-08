import 'package:ecommerce_app/core/helper/validator_app.dart';
import 'package:ecommerce_app/core/shared_widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_state.dart';
import 'package:ecommerce_app/feature/auth/presentation/widgets/form_field.dart';
import 'package:ecommerce_app/feature/auth/reset_password/presentation/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
          backgroundColor: ColorsManger.backgroundColor,
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
                            FormFieldWidget(
                              controller: currentPassword,
                              validator:ValidatorApp.validatePassword ,
                              label: 'CURRENT PASSWORD',
                              hintText: 'CURRENT PASSWORD',
                              isPassword: true,
                            ),
                            SizedBox(height: 20.h),
                            FormFieldWidget(
                              controller: newPassword,
                              validator: ValidatorApp.validatePassword,
                              label: 'NEW PASSWORD',
                              hintText: 'NEW PASSWORD',
                              isPassword: true,
                            ),
                            SizedBox(height: 20.h),
                            FormFieldWidget(
                              controller: confirmPassword,
                              validator:ValidatorApp.validatePassword,
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
                                    builder: (_) => const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorsManger.primaryColor,
                                      ),
                                    ),
                                  );
                                } else if (state is AuthSuccessState) {
                                  Navigator.pop(context); 
                                  Fluttertoast.showToast(
                                    msg:
                                        "Password has been changed successfully.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: ColorsManger.primaryColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
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