// feature/profile/presentation/widgets/widgets/icon_box.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final Color? color; // if null, the theme's gold color is used
  final double size;
  final double iconSize;

  const IconBox({
    super.key,
    required this.icon,
    this.color,
    this.size = 44,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.iconBox,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color ?? context.colors.gold, size: iconSize),
    );
  }
}
