import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

abstract class ColorsManger {
  static const Color primaryColor = Color(0xffB6A17A);
  static const Color backgroundColor = Color(0xff141416);
  static const Color white = Color(0xffE5E1E4);
  static const Color black = Color(0xff3C2E11);
  static const Color brown = Color(0xff4F4630);
  static const Color textPrimary = Color(0xffF2EFE8);
  static const Color surface = Color(0xff1D1C20);
  static const Color border = Color(0xff343136);
  static const Color navInactive = Color(0xff8A8A94);
  static const Color textSecondary = Color(0xffAAA59D);
  static const Color navBorder = Color(0xff2A2A32);
  static const Color navBackground = Color(0xF01D1D23);
  static const Color modalBackdrop = Color(0xBF141416);
  static const Color surfaceVariant = Color(0xff26252A);
  static const Color headerBackground = Color(0xD9141416);
  static const Color categoryCard = Color(0xff1F1F21);
  static const Color cartBadgeBg = Color(0xff1D1D23);
  static const Color dealsBadgeBg = Color(0xff353437);
  static const Color passwordColor = Color(0xffCFC5B8);
  static const Color foreground = Color(0xff221B08);
  static const Color cartButtonFg = Color(0xff382F1B);
  static const Color darkGrey = Color(0xFF2C2C2E);
  static const Color darkBackground = Color(0xFF131315);
  static const Color darkCard = Color(0xFF1C1C1F);
  static const Color darkIconBox = Color(0xFF2A2A2D);
  static const Color darkGold = Color(0xFFC9AE7C);
  static const Color darkGoldGlow = Color(0x99C9AE7C);
  static const Color darkOnGold = Color(0xFF131315);
  static const Color darkTextPrimary = Color(0xFFF2F2F2);
  static const Color darkTextBody = Color(0xFFD6CFC4);
  static const Color darkTextSecondary = Color(0xFF9A9A9F);
  static const Color darkTextMuted = Color(0xFF6E6E73);
  static const Color darkDanger = Color(0xFFF08A8A);
  static const Color darkDivider = Color(0xFF26262A);

  // Light Theme Colors
  static const Color lightPrimary = Color(0xff9B8054);
  static const Color lightBackground = Color(0xffF8F5EF);
  static const Color lightSurface = Color(0xffFFFFFF);
  static const Color lightTextPrimary = Color(0xff1E1B16);
  static const Color lightTextSecondary = Color(0xff77736C);
  static const Color lightBorder = Color(0xffE3DDD0);
  static const Color lightNavInactive = Color(0xff99958E);
  static const Color lightNavBackground = Color(0xffFFFFFF);
  static const Color lightNavBorder = Color(0xffE3DDD0);
  static const Color lightSurfaceVariant = Color(0xffF0EDE7);
  static const Color lightCategoryCard = Color(0xffFFFFFF);
  static const Color lightIconBox = Color(0xffF0EDE7);
  static const Color lightDivider = Color(0xffE3DDD0);
  static const Color lightDanger = Color(0xffC94B4B);
}

extension AppColorsContext on BuildContext {
  AppColors get appColors {
    final ThemeData theme = Theme.of(this);
    final bool isDark = theme.brightness == Brightness.dark;
    final LustreColors colors =
        theme.extension<LustreColors>() ??
        (isDark ? LustreColors.dark : LustreColors.light);
    return AppColors(isDark, colors);
  }
}

class AppColors {
  const AppColors(this.isDarkMode, this._colors);

  final bool isDarkMode;
  final LustreColors _colors;

  Color forTheme(Color darkColor, Color lightColor) =>
      isDarkMode ? darkColor : lightColor;

  Color get primaryColor => _colors.primaryColor;
  Color get backgroundColor => _colors.backgroundColor;
  Color get white => _colors.white;
  Color get black => _colors.black;
  Color get brown => _colors.brown;
  Color get textPrimary => _colors.textPrimary;
  Color get surface => _colors.surface;
  Color get cardSurface => _colors.cardSurface;
  Color get border => _colors.border;
  Color get navInactive => _colors.navInactive;
  Color get textSecondary => _colors.textSecondary;
  Color get navBorder => _colors.navBorder;
  Color get navBackground => _colors.navBackground;
  Color get modalBackdrop => _colors.modalBackdrop;
  Color get surfaceVariant => _colors.surfaceVariant;
  Color get headerBackground => _colors.headerBackground;
  Color get categoryCard => _colors.categoryCard;
  Color get cartBadgeBg => _colors.cartBadgeBg;
  Color get dealsBadgeBg => _colors.dealsBadgeBg;
  Color get passwordColor => _colors.passwordColor;
  Color get foreground => _colors.foreground;
  Color get cartButtonFg => _colors.cartButtonFg;
  Color get darkGrey => _colors.darkGrey;
  Color get darkBackground => _colors.darkBackground;
  Color get darkCard => _colors.darkCard;
  Color get darkIconBox => _colors.darkIconBox;
  Color get darkGold => _colors.darkGold;
  Color get darkGoldGlow => _colors.darkGoldGlow;
  Color get darkOnGold => _colors.darkOnGold;
  Color get darkTextPrimary => _colors.darkTextPrimary;
  Color get darkTextBody => _colors.darkTextBody;
  Color get darkTextSecondary => _colors.darkTextSecondary;
  Color get darkTextMuted => _colors.darkTextMuted;
  Color get darkDanger => _colors.darkDanger;
  Color get darkDivider => _colors.darkDivider;
  Color get adminBackgroundColor => _colors.adminBackgroundColor;
  Color get adminCardColor => _colors.adminCardColor;
  Color get adminGoldColor => _colors.adminGoldColor;
  Color get adminForegroundColor => _colors.adminForegroundColor;
  Color get adminBlackColor => _colors.adminBlackColor;
  Color get adminLabelColor => _colors.adminLabelColor;
  Color get adminGreyColor => _colors.adminGreyColor;
  Color get adminMutedColor => _colors.adminMutedColor;
  Color get adminVeryMutedColor => _colors.adminVeryMutedColor;
  Color get adminInactiveColor => _colors.adminInactiveColor;
  Color get adminPlaceholderColor => _colors.adminPlaceholderColor;
  Color get adminBorderColor => _colors.adminBorderColor;
  Color get adminStrongBorderColor => _colors.adminStrongBorderColor;
  Color get adminDangerColor => _colors.adminDangerColor;
  Color get adminDangerBackgroundColor => _colors.adminDangerBackgroundColor;
  Color get brightGold => _colors.brightGold;
  Color get otpGold => _colors.otpGold;
  Color get inputFill => _colors.inputFill;
}
