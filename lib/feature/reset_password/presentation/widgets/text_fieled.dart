import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class CustomTextFormFilled extends StatelessWidget {
  final String text;

  const new({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xff1B1B1D)),
      child: TextFormField(
        cursorColor: Color(0xffDAC49B),
        style: AppStyle.text14Semibold,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xff1B1B1D)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xff1B1B1D)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xff1B1B1D)),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final String text;

  const new({super.key, required this.text});

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
        Text(
          widget.text,
          style: AppStyle.text12Medium.copyWith(
            color: ColorsManger.textSecondary,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: ColorsManger.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            cursorColor: ColorsManger.primaryColor,
            obscureText: isobsecure,
            style: AppStyle.text14Semibold.copyWith(
              color: ColorsManger.passwordColor,
              letterSpacing: 2,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xff1D1C20)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xff1D1C20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xff1D1C20)),
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
        ),
      ],
    );
  }
}
