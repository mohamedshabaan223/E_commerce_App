import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? suffixText;
  final int maxLines;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.suffixText,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: context.appColors.adminLabelColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(
            color: context.appColors.adminForegroundColor,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: context.appColors.adminMutedColor,
              fontSize: 14,
            ),
            suffixText: suffixText,
            suffixStyle: TextStyle(
              color: context.appColors.adminGoldColor,
              fontSize: 12,
            ),
            filled: true,
            fillColor: context.appColors.adminCardColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.appColors.adminBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: context.appColors.adminGoldColor,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
