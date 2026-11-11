import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFilled extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const new({super.key, required this.text, this.controller, this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: Color(0xffDAC49B),
      style: AppStyle.text14Semibold,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.appColors.backgroundColor,
        hintText: text,
        errorStyle: TextStyle(color: context.appColors.darkDanger),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.appColors.darkDanger),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.appColors.darkDanger),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.appColors.backgroundColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.appColors.backgroundColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.appColors.backgroundColor),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String text;
  final int? index;

  const new({
    super.key,
    required this.text,
    this.controller,
    this.validator,
    this.index,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isobsecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: AppStyle.text12Medium),
        SizedBox(height: 10.h),
        TextFormField(
          autovalidateMode: widget.index == 1
              ? AutovalidateMode.onUserInteraction
              : null,
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: ColorsManger.primaryColor,
          obscureText: isobsecure,
          style: AppStyle.text14Semibold.copyWith(
            color: context.appColors.passwordColor,
            letterSpacing: 2,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: context.appColors.surface,
            errorStyle: TextStyle(color: context.appColors.darkDanger),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.appColors.darkDanger),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.appColors.darkDanger),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.appColors.surface),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.appColors.surface),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.appColors.surface),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isobsecure = !isobsecure;
                });
              },
              icon: Icon(
                isobsecure
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ColorsManger.passwordColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
