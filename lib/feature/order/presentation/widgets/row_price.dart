import 'package:flutter/material.dart';

class RowPrice extends StatelessWidget {
  const RowPrice({
    super.key,
    required this.label,
    required this.price,
    required this.textStyleLabel,
    required this.textStylePrice,
  });
  final String label;
  final String price;
  final TextStyle textStyleLabel;
  final TextStyle textStylePrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textStyleLabel),
        Text(price, style: textStylePrice),
      ],
    );
  }
}
