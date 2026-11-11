import 'package:flutter/material.dart';

/// LUSTRE custom colors, exposed as a [ThemeExtension] so they switch
/// automatically between Light and Dark [ThemeData].
/// This is the single source of truth for every theme-dependent color.
class LustreColors extends ThemeExtension<LustreColors> {
  const LustreColors({
    required this.primaryColor,
    required this.backgroundColor,
    required this.white,
    required this.black,
    required this.brown,
    required this.textPrimary,
    required this.surface,
    required this.cardSurface,
    required this.border,
    required this.navInactive,
    required this.textSecondary,
    required this.navBorder,
    required this.navBackground,
    required this.modalBackdrop,
    required this.surfaceVariant,
    required this.headerBackground,
    required this.categoryCard,
    required this.cartBadgeBg,
    required this.dealsBadgeBg,
    required this.passwordColor,
    required this.foreground,
    required this.cartButtonFg,
    required this.darkGrey,
    required this.darkBackground,
    required this.darkCard,
    required this.darkIconBox,
    required this.darkGold,
    required this.darkGoldGlow,
    required this.darkOnGold,
    required this.darkTextPrimary,
    required this.darkTextBody,
    required this.darkTextSecondary,
    required this.darkTextMuted,
    required this.darkDanger,
    required this.darkDivider,
    required this.adminBackgroundColor,
    required this.adminCardColor,
    required this.adminGoldColor,
    required this.adminForegroundColor,
    required this.adminBlackColor,
    required this.adminLabelColor,
    required this.adminGreyColor,
    required this.adminMutedColor,
    required this.adminVeryMutedColor,
    required this.adminInactiveColor,
    required this.adminPlaceholderColor,
    required this.adminBorderColor,
    required this.adminStrongBorderColor,
    required this.adminDangerColor,
    required this.adminDangerBackgroundColor,
    required this.brightGold,
    required this.otpGold,
    required this.inputFill,
  });

  final Color primaryColor;
  final Color backgroundColor;
  final Color white;
  final Color black;
  final Color brown;
  final Color textPrimary;
  final Color surface;
  final Color cardSurface;
  final Color border;
  final Color navInactive;
  final Color textSecondary;
  final Color navBorder;
  final Color navBackground;
  final Color modalBackdrop;
  final Color surfaceVariant;
  final Color headerBackground;
  final Color categoryCard;
  final Color cartBadgeBg;
  final Color dealsBadgeBg;
  final Color passwordColor;
  final Color foreground;
  final Color cartButtonFg;
  final Color darkGrey;
  final Color darkBackground;
  final Color darkCard;
  final Color darkIconBox;
  final Color darkGold;
  final Color darkGoldGlow;
  final Color darkOnGold;
  final Color darkTextPrimary;
  final Color darkTextBody;
  final Color darkTextSecondary;
  final Color darkTextMuted;
  final Color darkDanger;
  final Color darkDivider;
  final Color adminBackgroundColor;
  final Color adminCardColor;
  final Color adminGoldColor;
  final Color adminForegroundColor;
  final Color adminBlackColor;
  final Color adminLabelColor;
  final Color adminGreyColor;
  final Color adminMutedColor;
  final Color adminVeryMutedColor;
  final Color adminInactiveColor;
  final Color adminPlaceholderColor;
  final Color adminBorderColor;
  final Color adminStrongBorderColor;
  final Color adminDangerColor;
  final Color adminDangerBackgroundColor;
  final Color brightGold;
  final Color otpGold;
  final Color inputFill;

  static final LustreColors light = LustreColors(
    primaryColor: Color(0xff9B8054),
    backgroundColor: Color(0xffF8F5EF),
    white: Color(0xff1E1B16),
    black: Color(0xff1E1B16),
    brown: Color(0xff77736C),
    textPrimary: Color(0xff1E1B16),
    surface: Color(0xffFFFFFF),
    cardSurface: Color(0xffFFFFFF),
    border: Color(0xffE3DDD0),
    navInactive: Color(0xff99958E),
    textSecondary: Color(0xff77736C),
    navBorder: Color(0xffE3DDD0),
    navBackground: Color(0xffFFFFFF),
    modalBackdrop: Color(0xBF141416),
    surfaceVariant: Color(0xffF0EDE7),
    headerBackground: Color(0xffF8F5EF),
    categoryCard: Color(0xffFFFFFF),
    cartBadgeBg: Color(0xffF0EDE7),
    dealsBadgeBg: Color(0xffF0EDE7),
    passwordColor: Color(0xff77736C),
    foreground: Color(0xff1E1B16),
    cartButtonFg: Color(0xff1E1B16),
    darkGrey: Color(0xffF0EDE7),
    darkBackground: Color(0xffF8F5EF),
    darkCard: Color(0xffFFFFFF),
    darkIconBox: Color(0xffF0EDE7),
    darkGold: Color(0xff9B8054),
    darkGoldGlow: Color(0x999B8054),
    darkOnGold: Color(0xff1E1B16),
    darkTextPrimary: Color(0xff1E1B16),
    darkTextBody: Color(0xff77736C),
    darkTextSecondary: Color(0xff77736C),
    darkTextMuted: Color(0xff99958E),
    darkDanger: Color(0xffC94B4B),
    darkDivider: Color(0xffE3DDD0),
    adminBackgroundColor: Color(0xffF8F5EF),
    adminCardColor: Color(0xffFFFFFF),
    adminGoldColor: Color(0xff9B8054),
    adminForegroundColor: Color(0xff1E1B16),
    adminBlackColor: Color(0xff1E1B16),
    adminLabelColor: Color(0xff77736C),
    adminGreyColor: Color(0xff77736C),
    adminMutedColor: Color(0xff77736C),
    adminVeryMutedColor: Color(0xff99958E),
    adminInactiveColor: Color(0xff99958E),
    adminPlaceholderColor: Color(0xffF0EDE7),
    adminBorderColor: Color(0xffE3DDD0),
    adminStrongBorderColor: Color(0xffE3DDD0),
    adminDangerColor: Color(0xffC94B4B),
    adminDangerBackgroundColor: Color(0xffC94B4B),
    brightGold: Color(0xff9B8054),
    otpGold: Color(0xff9B8054),
    inputFill: Color(0xffF0EDE7),
  );

  static final LustreColors dark = LustreColors(
    primaryColor: Color(0xffB6A17A),
    backgroundColor: Color(0xff141416),
    white: Color(0xffE5E1E4),
    black: Color(0xff3C2E11),
    brown: Color(0xff4F4630),
    textPrimary: Color(0xffF2EFE8),
    surface: Color(0xff1D1C20),
    cardSurface: Color(0xff1B1B1D),
    border: Color(0xff343136),
    navInactive: Color(0xff8A8A94),
    textSecondary: Color(0xffAAA59D),
    navBorder: Color(0xff2A2A32),
    navBackground: Color(0xF01D1D23),
    modalBackdrop: Color(0xBF141416),
    surfaceVariant: Color(0xff26252A),
    headerBackground: Color(0xD9141416),
    categoryCard: Color(0xff1F1F21),
    cartBadgeBg: Color(0xff1D1D23),
    dealsBadgeBg: Color(0xff353437),
    passwordColor: Color(0xffCFC5B8),
    foreground: Color(0xff221B08),
    cartButtonFg: Color(0xff382F1B),
    darkGrey: Color(0xFF2C2C2E),
    darkBackground: Color(0xFF131315),
    darkCard: Color(0xFF1C1C1F),
    darkIconBox: Color(0xFF2A2A2D),
    darkGold: Color(0xFFC9AE7C),
    darkGoldGlow: Color(0x99C9AE7C),
    darkOnGold: Color(0xFF131315),
    darkTextPrimary: Color(0xFFF2F2F2),
    darkTextBody: Color(0xFFD6CFC4),
    darkTextSecondary: Color(0xFF9A9A9F),
    darkTextMuted: Color(0xFF6E6E73),
    darkDanger: Color(0xFFF08A8A),
    darkDivider: Color(0xFF26262A),
    adminBackgroundColor: Color(0xFF121212),
    adminCardColor: Color(0xFF1B1B1D),
    adminGoldColor: Color(0xFFC4B18B),
    adminForegroundColor: Color(0xFFFFFFFF),
    adminBlackColor: Color(0xFF000000),
    adminLabelColor: Color(0xFFBDBDBD),
    adminGreyColor: Color(0xFF9E9E9E),
    adminMutedColor: Color(0xFF757575),
    adminVeryMutedColor: Color(0xFF616161),
    adminInactiveColor: Color(0xFF9E9E9E),
    adminPlaceholderColor: Color(0xFF303030),
    adminBorderColor: Color(0x1AFFFFFF),
    adminStrongBorderColor: Color(0x3DFFFFFF),
    adminDangerColor: Color(0xFFFF5252),
    adminDangerBackgroundColor: Color(0xFF990000),
    brightGold: Color(0xFFC2A878),
    otpGold: Color(0xffDAC49B),
    inputFill: Color(0xFF26262A),
  );

  @override
  LustreColors copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? white,
    Color? black,
    Color? brown,
    Color? textPrimary,
    Color? surface,
    Color? cardSurface,
    Color? border,
    Color? navInactive,
    Color? textSecondary,
    Color? navBorder,
    Color? navBackground,
    Color? modalBackdrop,
    Color? surfaceVariant,
    Color? headerBackground,
    Color? categoryCard,
    Color? cartBadgeBg,
    Color? dealsBadgeBg,
    Color? passwordColor,
    Color? foreground,
    Color? cartButtonFg,
    Color? darkGrey,
    Color? darkBackground,
    Color? darkCard,
    Color? darkIconBox,
    Color? darkGold,
    Color? darkGoldGlow,
    Color? darkOnGold,
    Color? darkTextPrimary,
    Color? darkTextBody,
    Color? darkTextSecondary,
    Color? darkTextMuted,
    Color? darkDanger,
    Color? darkDivider,
    Color? adminBackgroundColor,
    Color? adminCardColor,
    Color? adminGoldColor,
    Color? adminForegroundColor,
    Color? adminBlackColor,
    Color? adminLabelColor,
    Color? adminGreyColor,
    Color? adminMutedColor,
    Color? adminVeryMutedColor,
    Color? adminInactiveColor,
    Color? adminPlaceholderColor,
    Color? adminBorderColor,
    Color? adminStrongBorderColor,
    Color? adminDangerColor,
    Color? adminDangerBackgroundColor,
    Color? brightGold,
    Color? otpGold,
    Color? inputFill,
  }) {
    return LustreColors(
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      white: white ?? this.white,
      black: black ?? this.black,
      brown: brown ?? this.brown,
      textPrimary: textPrimary ?? this.textPrimary,
      surface: surface ?? this.surface,
      cardSurface: cardSurface ?? this.cardSurface,
      border: border ?? this.border,
      navInactive: navInactive ?? this.navInactive,
      textSecondary: textSecondary ?? this.textSecondary,
      navBorder: navBorder ?? this.navBorder,
      navBackground: navBackground ?? this.navBackground,
      modalBackdrop: modalBackdrop ?? this.modalBackdrop,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      headerBackground: headerBackground ?? this.headerBackground,
      categoryCard: categoryCard ?? this.categoryCard,
      cartBadgeBg: cartBadgeBg ?? this.cartBadgeBg,
      dealsBadgeBg: dealsBadgeBg ?? this.dealsBadgeBg,
      passwordColor: passwordColor ?? this.passwordColor,
      foreground: foreground ?? this.foreground,
      cartButtonFg: cartButtonFg ?? this.cartButtonFg,
      darkGrey: darkGrey ?? this.darkGrey,
      darkBackground: darkBackground ?? this.darkBackground,
      darkCard: darkCard ?? this.darkCard,
      darkIconBox: darkIconBox ?? this.darkIconBox,
      darkGold: darkGold ?? this.darkGold,
      darkGoldGlow: darkGoldGlow ?? this.darkGoldGlow,
      darkOnGold: darkOnGold ?? this.darkOnGold,
      darkTextPrimary: darkTextPrimary ?? this.darkTextPrimary,
      darkTextBody: darkTextBody ?? this.darkTextBody,
      darkTextSecondary: darkTextSecondary ?? this.darkTextSecondary,
      darkTextMuted: darkTextMuted ?? this.darkTextMuted,
      darkDanger: darkDanger ?? this.darkDanger,
      darkDivider: darkDivider ?? this.darkDivider,
      adminBackgroundColor: adminBackgroundColor ?? this.adminBackgroundColor,
      adminCardColor: adminCardColor ?? this.adminCardColor,
      adminGoldColor: adminGoldColor ?? this.adminGoldColor,
      adminForegroundColor: adminForegroundColor ?? this.adminForegroundColor,
      adminBlackColor: adminBlackColor ?? this.adminBlackColor,
      adminLabelColor: adminLabelColor ?? this.adminLabelColor,
      adminGreyColor: adminGreyColor ?? this.adminGreyColor,
      adminMutedColor: adminMutedColor ?? this.adminMutedColor,
      adminVeryMutedColor: adminVeryMutedColor ?? this.adminVeryMutedColor,
      adminInactiveColor: adminInactiveColor ?? this.adminInactiveColor,
      adminPlaceholderColor: adminPlaceholderColor ?? this.adminPlaceholderColor,
      adminBorderColor: adminBorderColor ?? this.adminBorderColor,
      adminStrongBorderColor:
          adminStrongBorderColor ?? this.adminStrongBorderColor,
      adminDangerColor: adminDangerColor ?? this.adminDangerColor,
      adminDangerBackgroundColor:
          adminDangerBackgroundColor ?? this.adminDangerBackgroundColor,
      brightGold: brightGold ?? this.brightGold,
      otpGold: otpGold ?? this.otpGold,
      inputFill: inputFill ?? this.inputFill,
    );
  }

  @override
  LustreColors lerp(covariant ThemeExtension<LustreColors>? other, double t) {
    if (other is! LustreColors) {
      return this;
    }
    return LustreColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      brown: Color.lerp(brown, other.brown, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      cardSurface: Color.lerp(cardSurface, other.cardSurface, t)!,
      border: Color.lerp(border, other.border, t)!,
      navInactive: Color.lerp(navInactive, other.navInactive, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      navBorder: Color.lerp(navBorder, other.navBorder, t)!,
      navBackground: Color.lerp(navBackground, other.navBackground, t)!,
      modalBackdrop: Color.lerp(modalBackdrop, other.modalBackdrop, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      headerBackground: Color.lerp(headerBackground, other.headerBackground, t)!,
      categoryCard: Color.lerp(categoryCard, other.categoryCard, t)!,
      cartBadgeBg: Color.lerp(cartBadgeBg, other.cartBadgeBg, t)!,
      dealsBadgeBg: Color.lerp(dealsBadgeBg, other.dealsBadgeBg, t)!,
      passwordColor: Color.lerp(passwordColor, other.passwordColor, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      cartButtonFg: Color.lerp(cartButtonFg, other.cartButtonFg, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      darkBackground: Color.lerp(darkBackground, other.darkBackground, t)!,
      darkCard: Color.lerp(darkCard, other.darkCard, t)!,
      darkIconBox: Color.lerp(darkIconBox, other.darkIconBox, t)!,
      darkGold: Color.lerp(darkGold, other.darkGold, t)!,
      darkGoldGlow: Color.lerp(darkGoldGlow, other.darkGoldGlow, t)!,
      darkOnGold: Color.lerp(darkOnGold, other.darkOnGold, t)!,
      darkTextPrimary: Color.lerp(darkTextPrimary, other.darkTextPrimary, t)!,
      darkTextBody: Color.lerp(darkTextBody, other.darkTextBody, t)!,
      darkTextSecondary:
          Color.lerp(darkTextSecondary, other.darkTextSecondary, t)!,
      darkTextMuted: Color.lerp(darkTextMuted, other.darkTextMuted, t)!,
      darkDanger: Color.lerp(darkDanger, other.darkDanger, t)!,
      darkDivider: Color.lerp(darkDivider, other.darkDivider, t)!,
      adminBackgroundColor:
          Color.lerp(adminBackgroundColor, other.adminBackgroundColor, t)!,
      adminCardColor: Color.lerp(adminCardColor, other.adminCardColor, t)!,
      adminGoldColor: Color.lerp(adminGoldColor, other.adminGoldColor, t)!,
      adminForegroundColor:
          Color.lerp(adminForegroundColor, other.adminForegroundColor, t)!,
      adminBlackColor: Color.lerp(adminBlackColor, other.adminBlackColor, t)!,
      adminLabelColor: Color.lerp(adminLabelColor, other.adminLabelColor, t)!,
      adminGreyColor: Color.lerp(adminGreyColor, other.adminGreyColor, t)!,
      adminMutedColor: Color.lerp(adminMutedColor, other.adminMutedColor, t)!,
      adminVeryMutedColor:
          Color.lerp(adminVeryMutedColor, other.adminVeryMutedColor, t)!,
      adminInactiveColor:
          Color.lerp(adminInactiveColor, other.adminInactiveColor, t)!,
      adminPlaceholderColor:
          Color.lerp(adminPlaceholderColor, other.adminPlaceholderColor, t)!,
      adminBorderColor:
          Color.lerp(adminBorderColor, other.adminBorderColor, t)!,
      adminStrongBorderColor:
          Color.lerp(adminStrongBorderColor, other.adminStrongBorderColor, t)!,
      adminDangerColor:
          Color.lerp(adminDangerColor, other.adminDangerColor, t)!,
      adminDangerBackgroundColor:
          Color.lerp(adminDangerBackgroundColor, other.adminDangerBackgroundColor, t)!,
      brightGold: Color.lerp(brightGold, other.brightGold, t)!,
      otpGold: Color.lerp(otpGold, other.otpGold, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
    );
  }
}

/// Complete Light and Dark ThemeData for the LUSTRE application.
abstract class AppTheme {
  static final ThemeData light = _build(Brightness.light);

  static final ThemeData dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final LustreColors c = isDark ? LustreColors.dark : LustreColors.light;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: c.backgroundColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: c.primaryColor,
        onPrimary: c.foreground,
        secondary: c.darkGold,
        onSecondary: c.darkOnGold,
        error: c.darkDanger,
        onError: isDark ? const Color(0xFF131315) : const Color(0xffFFFFFF),
        surface: c.surface,
        onSurface: c.textPrimary,
        outline: c.border,
        outlineVariant: c.darkDivider,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c.backgroundColor,
        foregroundColor: c.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: c.primaryColor),
      ),
      iconTheme: IconThemeData(color: c.textPrimary),
      cardTheme: CardThemeData(
        color: c.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dividerTheme: DividerThemeData(color: c.darkDivider, thickness: 1),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF1B1B1D),
        contentTextStyle: const TextStyle(color: Color(0xFFF2F2F2)),
      ),
      inputDecorationTheme: InputDecorationTheme(fillColor: c.surfaceVariant),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.primaryColor,
          foregroundColor: c.foreground,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: c.primaryColor),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.primaryColor,
          side: BorderSide(color: c.border),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.darkGold
              : c.textSecondary,
        ),
        trackColor: WidgetStateProperty.all(c.darkIconBox),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.primaryColor
              : Colors.transparent,
        ),
        checkColor: WidgetStateProperty.all(c.foreground),
        side: BorderSide(color: c.border),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.primaryColor,
        linearTrackColor: c.surfaceVariant,
      ),
      extensions: <ThemeExtension<dynamic>>[c],
    );
  }
}
