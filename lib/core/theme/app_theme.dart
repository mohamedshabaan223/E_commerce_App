import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color _primary = Color(0xffB6A17A);
  static const Color _onPrimary = Color(0xff221B08);
  static const Color _background = Color(0xffF8F5EF);
  static const Color _surface = Color(0xffFFFFFF);
  static const Color _border = Color(0xffE3DDD0);
  static const Color _textPrimary = Color(0xff1E1B16);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _background,

    colorScheme: const ColorScheme.light(
      primary: _primary,
      onPrimary: _onPrimary,
      surface: _surface,
      onSurface: _textPrimary,
      outline: _border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: _background,
      foregroundColor: _textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: _primary),
    ),

    dividerTheme: const DividerThemeData(color: _border, thickness: 1),
  );
}
