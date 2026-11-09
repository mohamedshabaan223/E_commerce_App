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
  AppColors get appColors =>
      AppColors(Theme.of(this).brightness == Brightness.dark);
}

class AppColors {
  const AppColors(this.isDarkMode);

  final bool isDarkMode;

  Color forTheme(Color darkColor, Color lightColor) =>
      isDarkMode ? darkColor : lightColor;

  Color get primaryColor =>
      isDarkMode ? ColorsManger.primaryColor : ColorsManger.lightPrimary;
  Color get backgroundColor =>
      isDarkMode ? ColorsManger.backgroundColor : ColorsManger.lightBackground;
  Color get white =>
      isDarkMode ? ColorsManger.white : ColorsManger.lightTextPrimary;
  Color get black =>
      isDarkMode ? ColorsManger.black : ColorsManger.lightTextPrimary;
  Color get brown =>
      isDarkMode ? ColorsManger.brown : ColorsManger.lightTextSecondary;
  Color get textPrimary =>
      isDarkMode ? ColorsManger.textPrimary : ColorsManger.lightTextPrimary;
  Color get surface =>
      isDarkMode ? ColorsManger.surface : ColorsManger.lightSurface;
  Color get cardSurface =>
      isDarkMode ? const Color(0xff1B1B1D) : ColorsManger.lightSurface;
  Color get border =>
      isDarkMode ? ColorsManger.border : ColorsManger.lightBorder;
  Color get navInactive =>
      isDarkMode ? ColorsManger.navInactive : ColorsManger.lightNavInactive;
  Color get textSecondary =>
      isDarkMode ? ColorsManger.textSecondary : ColorsManger.lightTextSecondary;
  Color get navBorder =>
      isDarkMode ? ColorsManger.navBorder : ColorsManger.lightNavBorder;
  Color get navBackground =>
      isDarkMode ? ColorsManger.navBackground : ColorsManger.lightNavBackground;
  Color get modalBackdrop => ColorsManger.modalBackdrop;
  Color get surfaceVariant => isDarkMode
      ? ColorsManger.surfaceVariant
      : ColorsManger.lightSurfaceVariant;
  Color get headerBackground =>
      isDarkMode ? ColorsManger.headerBackground : ColorsManger.lightBackground;
  Color get categoryCard =>
      isDarkMode ? ColorsManger.categoryCard : ColorsManger.lightCategoryCard;
  Color get cartBadgeBg =>
      isDarkMode ? ColorsManger.cartBadgeBg : ColorsManger.lightSurfaceVariant;
  Color get dealsBadgeBg =>
      isDarkMode ? ColorsManger.dealsBadgeBg : ColorsManger.lightSurfaceVariant;
  Color get passwordColor =>
      isDarkMode ? ColorsManger.passwordColor : ColorsManger.lightTextSecondary;
  Color get foreground =>
      isDarkMode ? ColorsManger.foreground : ColorsManger.lightTextPrimary;
  Color get cartButtonFg =>
      isDarkMode ? ColorsManger.cartButtonFg : ColorsManger.lightTextPrimary;
  Color get darkGrey =>
      isDarkMode ? ColorsManger.darkGrey : ColorsManger.lightSurfaceVariant;
  Color get darkBackground =>
      isDarkMode ? ColorsManger.darkBackground : ColorsManger.lightBackground;
  Color get darkCard =>
      isDarkMode ? ColorsManger.darkCard : ColorsManger.lightSurface;
  Color get darkIconBox =>
      isDarkMode ? ColorsManger.darkIconBox : ColorsManger.lightIconBox;
  Color get darkGold =>
      isDarkMode ? ColorsManger.darkGold : ColorsManger.lightPrimary;
  Color get darkGoldGlow => isDarkMode
      ? ColorsManger.darkGoldGlow
      : ColorsManger.lightPrimary.withValues(alpha: 0.6);
  Color get darkOnGold =>
      isDarkMode ? ColorsManger.darkOnGold : ColorsManger.lightTextPrimary;
  Color get darkTextPrimary =>
      isDarkMode ? ColorsManger.darkTextPrimary : ColorsManger.lightTextPrimary;
  Color get darkTextBody =>
      isDarkMode ? ColorsManger.darkTextBody : ColorsManger.lightTextSecondary;
  Color get darkTextSecondary => isDarkMode
      ? ColorsManger.darkTextSecondary
      : ColorsManger.lightTextSecondary;
  Color get darkTextMuted =>
      isDarkMode ? ColorsManger.darkTextMuted : ColorsManger.lightNavInactive;
  Color get darkDanger =>
      isDarkMode ? ColorsManger.darkDanger : ColorsManger.lightDanger;
  Color get darkDivider =>
      isDarkMode ? ColorsManger.darkDivider : ColorsManger.lightDivider;
  Color get adminBackgroundColor =>
      isDarkMode ? const Color(0xFF121212) : ColorsManger.lightBackground;
  Color get adminCardColor =>
      isDarkMode ? const Color(0xFF1B1B1D) : ColorsManger.lightSurface;
  Color get adminGoldColor =>
      isDarkMode ? const Color(0xFFC4B18B) : ColorsManger.lightPrimary;
  Color get adminForegroundColor =>
      isDarkMode ? Colors.white : ColorsManger.lightTextPrimary;
  Color get adminBlackColor =>
      isDarkMode ? Colors.black : ColorsManger.lightTextPrimary;
  Color get adminLabelColor =>
      isDarkMode ? Colors.grey.shade400 : ColorsManger.lightTextSecondary;
  Color get adminGreyColor =>
      isDarkMode ? Colors.grey : ColorsManger.lightTextSecondary;
  Color get adminMutedColor =>
      isDarkMode ? Colors.grey.shade600 : ColorsManger.lightTextSecondary;
  Color get adminVeryMutedColor =>
      isDarkMode ? Colors.grey.shade700 : ColorsManger.lightNavInactive;
  Color get adminInactiveColor =>
      isDarkMode ? Colors.grey.shade500 : ColorsManger.lightNavInactive;
  Color get adminPlaceholderColor =>
      isDarkMode ? const Color(0xFF303030) : ColorsManger.lightSurfaceVariant;
  Color get adminBorderColor =>
      isDarkMode ? Colors.white12 : ColorsManger.lightBorder;
  Color get adminStrongBorderColor =>
      isDarkMode ? Colors.white24 : ColorsManger.lightBorder;
  Color get adminDangerColor =>
      isDarkMode ? Colors.redAccent : ColorsManger.lightDanger;
  Color get adminDangerBackgroundColor =>
      isDarkMode ? const Color(0xFF990000) : ColorsManger.lightDanger;
}
