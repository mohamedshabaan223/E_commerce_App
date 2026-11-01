import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Global theme mode. The Dark Mode switch in the Profile screen changes it.
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

class AppTheme {
  /// Serif font used for titles and headings.
  /// If [color] is null, the color comes from the current theme.
  static TextStyle heading({double size = 20, Color? color}) =>
      GoogleFonts.playfairDisplay(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
      );

  /// Sans font used for body text.
  static TextStyle body({
    double size = 15,
    Color? color,
    FontWeight weight = FontWeight.w400,
    double? height,
    double? letterSpacing,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
      );

  static ThemeData _build(Brightness brightness, AppColors c) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: c.background,
      colorScheme: base.colorScheme.copyWith(
        primary: c.gold,
        surface: c.card,
        onSurface: c.textPrimary,
      ),
      textTheme: base.textTheme
          .apply(bodyColor: c.textPrimary, displayColor: c.textPrimary),
      extensions: [c],
    );
  }

  static ThemeData get dark => _build(Brightness.dark, AppColors.dark);
  static ThemeData get light => _build(Brightness.light, AppColors.light);
}
