// feature/profile/presentation/widgets/widgets/luxe_app_bar.dart
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';


class LuxeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const LuxeAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded,
            color: context.colors.textPrimary, size: 20),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(title, style: AppTheme.heading(size: 20)),
    );
  }
}
