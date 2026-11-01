import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;

  const FormFieldWidget({
    super.key,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(
            isObscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        )
            : widget.suffixIcon == null
            ? null
            : Icon(widget.suffixIcon),
      ),
    );
  }
}