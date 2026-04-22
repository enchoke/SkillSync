import 'package:flutter/material.dart';
import 'package:skillsync/barrel_file.dart';

class SSThemes {
  final AppTheme selectedTheme;

  SSThemes(this.selectedTheme);

  ThemeData get(BuildContext context) {
    SSTheme colors = selectedTheme.colorTheme;
    SSTextTheme textStyles = selectedTheme.textStyles;
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, scrolledUnderElevation: 0),
      splashColor: colors.primary.withValues(alpha: 0.5),
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      disabledColor: colors.disabled,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: colors.primary,
            secondary: colors.secondary,
            error: colors.error,
          ),
      textTheme: TextTheme(
        titleLarge: textStyles.text1,
        titleMedium: textStyles.text2,
        titleSmall: textStyles.text3,
        bodyLarge: textStyles.text4,
        bodyMedium: textStyles.text4,
        bodySmall: textStyles.text5,
        displayLarge: textStyles.text4,
        displayMedium: textStyles.text4,
        displaySmall: textStyles.text4,
        headlineLarge: textStyles.text4,
        headlineMedium: textStyles.text4,
        headlineSmall: textStyles.text4,
        labelLarge: textStyles.text4,
        labelMedium: textStyles.text4,
        labelSmall: textStyles.text4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(colors.buttonRadius))),
          enableFeedback: true,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) return colors.disabled;
              if (states.contains(WidgetState.hovered)) return Colors.transparent;
              return Colors.transparent;
            },
          ),
          shadowColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) return Colors.transparent;
              if (states.contains(WidgetState.hovered)) return Colors.transparent;
              return Colors.transparent;
            },
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(colors.buttonRadius))),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) return colors.buttonPrimary;
              return colors.buttonSecondary;
            },
          ),
          side: WidgetStateProperty.resolveWith<BorderSide>(
            (Set<WidgetState> states) {
              // return BorderSide.none;
              // if (states.contains(WidgetState.selected)) return BorderSide.none;
              return BorderSide(color: colors.tile, width: 1);
            },
          ),
          foregroundColor: WidgetStateProperty.all(colors.textColors.button),
          // padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        ),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: colors.drawer),
      iconTheme: IconThemeData(color: colors.icon),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all(colors.icon))),
      dialogTheme: DialogThemeData(backgroundColor: colors.background),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.tileSecondary,
        labelStyle: textStyles.text3,
        floatingLabelStyle: textStyles.text2,
        hintStyle: textStyles.text5.copyWith(color: colors.textColors.hint),
        errorStyle: textStyles.text4ER,
        helperStyle: textStyles.text4.copyWith(fontSize: 13),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: colors.error, width: 1)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: colors.error, width: 1.5)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: colors.border, width: 1)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: colors.border, width: 1.5)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: colors.disabled, width: 0.4)),
        isDense: true,
        filled: true,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.navigation,
        selectedItemColor: colors.icon,
        unselectedItemColor: colors.icon.withValues(alpha: 0.5),
        elevation: 0,
      ),
      listTileTheme: ListTileThemeData(
        dense: true,
        iconColor: colors.icon,
        contentPadding: EdgeInsets.zero,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: textStyles.text4,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: colors.tileSecondary,
          filled: true,
          isDense: true,
          iconColor: colors.icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: colors.border, width: 1)),
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(colors.tile),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: colors.border, width: 1),
            ),
          ),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(colors.scrollColor.withValues(alpha: 0.5)),
      ),
    );
  }
}
