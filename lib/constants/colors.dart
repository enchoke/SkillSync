import 'package:flutter/material.dart';
import 'package:skillsync/barrel_file.dart';

class SSTheme {
  final SSTextColors textColors;
  final Color primary;
  final Color secondary;
  final Color background;
  final Color icon;
  final Color tile;
  final Color tileSecondary;
  final Color warning;
  final Color disabled;
  final Color error;
  final Color green;
  final Color border;
  final Color drawer;
  final Color grey;
  final Color navigation;
  final Color white;
  final Color buttonPrimary;
  final Color buttonSecondary;
  final Color buttonDisabled;
  final double webPadding;
  final double buttonRadius;
  final Color oppositeBackground;
  final Color scrollColor;

  const SSTheme({
    required this.primary,
    required this.icon,
    required this.secondary,
    required this.background,
    required this.textColors,
    required this.tile,
    required this.tileSecondary,
    required this.disabled,
    required this.error,
    required this.green,
    required this.border,
    required this.drawer,
    required this.warning,
    required this.grey,
    required this.navigation,
    required this.white,
    required this.buttonPrimary,
    required this.buttonSecondary,
    required this.buttonDisabled,
    required this.webPadding,
    required this.buttonRadius,
    required this.oppositeBackground,
    required this.scrollColor,
  });
}

class SSTextColors {
  final Color body;
  final Color hint;
  final Color error;
  final Color link;
  final Color button;
  final Color supportInfo;

  const SSTextColors({
    required this.body,
    required this.hint,
    required this.error,
    required this.link,
    required this.button,
    required this.supportInfo,
  });
}

class SSTextTheme {
  final TextStyle text1;
  final TextStyle text2;
  final TextStyle text3;
  final TextStyle text4;
  final TextStyle text5;
  final TextStyle text6;
  final TextStyle text7;
  final TextStyle text1B;
  final TextStyle text2B;
  final TextStyle text3B;
  final TextStyle text4B;
  final TextStyle text4BW_70;
  final TextStyle text5B;
  final TextStyle text6B;
  final TextStyle text3BW_70;
  final TextStyle text4ER;

  const SSTextTheme({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text1B,
    required this.text2B,
    required this.text3B,
    required this.text4B,
    required this.text4BW_70,
    required this.text5B,
    required this.text6B,
    required this.text4ER,
    required this.text3BW_70,
  });
}

extension CSColorThemes on AppTheme {
  SSTheme get colorTheme {
    switch (this) {
      case AppTheme.dark:
        return const SSTheme(
          primary: Color(0xFF52C0F8),
          secondary: Color(0xFF958800),
          background: Color(0xFF0A0F1E),
          disabled: Color(0xff808080),
          icon: Color(0xffffffff),
          textColors: SSTextColors(
            body: Color(0xffffffff),
            hint: Color(0xff808080),
            error: Color(0xffff0000),
            link: Color(0xff5a8bb2),
            button: Color(0xFF000000),
            supportInfo: Color(0xFFB8860B),
          ),
          error: Color(0xffff0000),
          green: Color(0xff00ff00),
          tile: Color(0xFF1E1E1E),
          tileSecondary: Color(0xFF2C2C2C),
          border: Color(0x1AA8B9FF),
          drawer: Color(0xFF1E1E1E),
          warning: Color(0xFFFFA500),
          grey: Color(0xff808080),
          navigation: Color(0xFF1E1E1E),
          white: Color(0xffffffff),
          buttonPrimary: Color(0xFF52C0F8),
          buttonSecondary: Color(0xFF7C62A6),
          buttonDisabled: Color(0x1AA8B9FF),
          webPadding: 100,
          buttonRadius: 24,
          oppositeBackground: Color(0xffffffff),
          scrollColor: Color(0xffffffff),
        );
      case AppTheme.light:
        return const SSTheme(
          primary: Color(0xFFF9B332),
          secondary: Color(0xFF958800),
          background: Color(0xFFFAFAFA),
          disabled: Color(0xff808080),
          icon: Color(0xFF000000),
          textColors: SSTextColors(
            body: Color(0xFF000000),
            hint: Color(0xff808080),
            error: Color(0xffff0000),
            link: Color(0xff0000ff),
            button: Color(0xffffffff),
            supportInfo: Color(0xFFB8860B),
          ),
          error: Color(0xffff0000),
          green: Color(0xff00ff00),
          tile: Color(0xFFEFEFEF),
          tileSecondary: Color(0xFFD8D8D8),
          border: Color(0x1AA8B9FF),
          drawer: Color(0xFFEFEFEF),
          warning: Color(0xFFFFA500),
          grey: Color(0xff808080),
          navigation: Color(0xFFD8D8D8),
          white: Color(0xffffffff),
          buttonPrimary: Color(0xFF000000),
          buttonSecondary: Color(0xFF000000),
          buttonDisabled: Color(0xFF000000),
          webPadding: 100,
          buttonRadius: 24,
          oppositeBackground: Color(0xFF000000),
          scrollColor: Color(0xFF000000),
        );
    }
  }

  SSTextTheme get textStyles {
    SSTextColors colors = colorTheme.textColors;
    return SSTextTheme(
      // Normal
      text1: TextStyle(color: colors.body, fontSize: 32, fontWeight: FontWeight.normal),
      text2: TextStyle(color: colors.body, fontSize: 24, fontWeight: FontWeight.normal),
      text3: TextStyle(color: colors.body, fontSize: 20, fontWeight: FontWeight.normal),
      text4: TextStyle(color: colors.body, fontSize: 18, fontWeight: FontWeight.normal),
      text5: TextStyle(color: colors.body, fontSize: 16, fontWeight: FontWeight.normal),
      text6: TextStyle(color: colors.body, fontSize: 14, fontWeight: FontWeight.normal),
      text7: TextStyle(color: colors.body, fontSize: 12, fontWeight: FontWeight.normal),
      text1B: TextStyle(color: colors.body, fontSize: 32, fontWeight: FontWeight.bold),
      text2B: TextStyle(color: colors.body.withValues(alpha: 0.7), fontSize: 24, fontWeight: FontWeight.bold),
      text3B: TextStyle(color: colors.body, fontSize: 20, fontWeight: FontWeight.bold),
      text4B: TextStyle(color: colors.body, fontSize: 18, fontWeight: FontWeight.bold),
      text5B: TextStyle(color: colors.body, fontSize: 16, fontWeight: FontWeight.bold),
      text6B: TextStyle(color: colors.body, fontSize: 14, fontWeight: FontWeight.bold),
      text4ER: TextStyle(color: colors.error, fontSize: 16, fontWeight: FontWeight.normal),
      text3BW_70: TextStyle(color: colors.body.withValues(alpha: 0.7), fontSize: 20, fontWeight: FontWeight.normal),
      text4BW_70: TextStyle(color: colors.body.withValues(alpha: 0.7), fontSize: 16, fontWeight: FontWeight.normal),
    );
  }
}
