import 'package:flutter/material.dart';

/// Color palette that changes with the theme (dark / light).
/// Usage inside any widget: `context.colors.card`
@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color card;
  final Color iconBox;
  final Color gold;
  final Color onGold;
  final Color textPrimary;
  final Color textBody;
  final Color textSecondary;
  final Color textMuted;
  final Color danger;
  final Color divider;

  const AppColors({
    required this.background,
    required this.card,
    required this.iconBox,
    required this.gold,
    required this.onGold,
    required this.textPrimary,
    required this.textBody,
    required this.textSecondary,
    required this.textMuted,
    required this.danger,
    required this.divider,
  });

  static const dark = AppColors(
    background: Color(0xFF131315),
    card: Color(0xFF1C1C1F),
    iconBox: Color(0xFF2A2A2D),
    gold: Color(0xFFC9AE7C),
    onGold: Color(0xFF131315),
    textPrimary: Color(0xFFF2F2F2),
    textBody: Color(0xFFD6CFC4),
    textSecondary: Color(0xFF9A9A9F),
    textMuted: Color(0xFF6E6E73),
    danger: Color(0xFFF08A8A),
    divider: Color(0xFF26262A),
  );

  static const light = AppColors(
    background: Color(0xFFF6F4F0),
    card: Color(0xFFFFFFFF),
    iconBox: Color(0xFFEDE8DF),
    gold: Color(0xFFA88B55),
    onGold: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF1A1A1C),
    textBody: Color(0xFF4A453D),
    textSecondary: Color(0xFF6B6B70),
    textMuted: Color(0xFF9A9A9F),
    danger: Color(0xFFD64545),
    divider: Color(0xFFE6E2DA),
  );

  @override
  AppColors copyWith({Color? background, Color? card, Color? gold}) =>
      AppColors(
        background: background ?? this.background,
        card: card ?? this.card,
        iconBox: iconBox,
        gold: gold ?? this.gold,
        onGold: onGold,
        textPrimary: textPrimary,
        textBody: textBody,
        textSecondary: textSecondary,
        textMuted: textMuted,
        danger: danger,
        divider: divider,
      );

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      background: l(background, other.background),
      card: l(card, other.card),
      iconBox: l(iconBox, other.iconBox),
      gold: l(gold, other.gold),
      onGold: l(onGold, other.onGold),
      textPrimary: l(textPrimary, other.textPrimary),
      textBody: l(textBody, other.textBody),
      textSecondary: l(textSecondary, other.textSecondary),
      textMuted: l(textMuted, other.textMuted),
      danger: l(danger, other.danger),
      divider: l(divider, other.divider),
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
