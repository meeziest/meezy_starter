import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import 'color_scheme/app_color_scheme.dart';

abstract final class AppThemeData {
  const AppThemeData._();

  static ThemeData tabysLightTheme(AppColorScheme colorScheme) {
    final textTheme = AppTextTheme(colorScheme);
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.primaryBackground,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      iconButtonTheme: _iconButtonThemeData(colorScheme),
      progressIndicatorTheme: _progressIndicatorTheme(colorScheme),
      dropdownMenuTheme: _dropdownMenuTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      expansionTileTheme: _expansionTileTheme(colorScheme),
      listTileTheme: _listTileTheme(colorScheme),
      dividerTheme: _dividerTheme(colorScheme),
      filledButtonTheme: _filledButtonThemeData(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      extensions: [
        AppColorSchemeExtension(colorScheme),
        AppTextStylesExtension(textTheme),
      ],
    );
  }

  static ThemeData tabysDarkTheme(AppColorScheme colorScheme) {
    final textTheme = AppTextTheme(colorScheme);
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.primaryBackground,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      iconButtonTheme: _iconButtonThemeData(colorScheme),
      progressIndicatorTheme: _progressIndicatorTheme(colorScheme),
      dropdownMenuTheme: _dropdownMenuTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      expansionTileTheme: _expansionTileTheme(colorScheme),
      listTileTheme: _listTileTheme(colorScheme),
      dividerTheme: _dividerTheme(colorScheme),
      filledButtonTheme: _filledButtonThemeData(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      extensions: [
        AppColorSchemeExtension(colorScheme),
        AppTextStylesExtension(textTheme),
      ],
    );
  }

  static IconButtonThemeData _iconButtonThemeData(AppColorScheme colorScheme) => IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(colorScheme.tertiary),
          backgroundColor: WidgetStateProperty.all(colorScheme.tertiary),
          shape: WidgetStateProperty.all(const CircleBorder()),
        ),
      );

  static AppBarTheme _appBarTheme(AppColorScheme colorScheme) => const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      );

  static ProgressIndicatorThemeData _progressIndicatorTheme(AppColorScheme colorScheme) =>
      ProgressIndicatorThemeData(
        color: colorScheme.secondary,
        linearMinHeight: 2,
      );

  static CardTheme _cardTheme(AppColorScheme colorScheme) => CardTheme(
        shadowColor: Colors.black,
        elevation: 4,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );

  static DropdownMenuThemeData _dropdownMenuTheme(AppColorScheme colorScheme) => DropdownMenuThemeData(
        textStyle: AppTextTheme(colorScheme).labelLarge?.copyWith(
              color: colorScheme.tertiary.withOpacity(0.88),
            ),
        menuStyle: MenuStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.shadow),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme(AppColorScheme colorScheme) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBackgroundColor: colorScheme.secondary,
          disabledForegroundColor: colorScheme.onSecondary,
          padding: const EdgeInsets.symmetric(vertical: 17),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonTheme(AppColorScheme colorScheme) => OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            AppTextTheme(colorScheme).bodyMedium?.copyWith(color: colorScheme.secondary),
          ),
          backgroundColor: WidgetStatePropertyAll(colorScheme.primaryContainer),
          foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimaryContainer),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: colorScheme.outline),
            ),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme(AppColorScheme colorScheme) => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.outlineVariant,
          ),
        ),
        focusColor: colorScheme.onPrimary,
        fillColor: colorScheme.tertiary,
        filled: true,
        labelStyle: AppTextTheme(colorScheme).bodySmall,
        hintStyle: AppTextTheme(colorScheme).bodyMedium?.copyWith(color: colorScheme.onTertiary),
        errorStyle: AppTextTheme(colorScheme).bodySmall?.copyWith(color: colorScheme.error),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.only(top: 19, right: 16, left: 16, bottom: 19),
      );

  static ExpansionTileThemeData _expansionTileTheme(AppColorScheme colorScheme) => ExpansionTileThemeData(
        textColor: Colors.black,
        collapsedTextColor: Colors.black,
        collapsedBackgroundColor: Colors.white,
        childrenPadding: EdgeInsets.zero,
        expandedAlignment: Alignment.centerLeft,
        tilePadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          1,
        ),
      );

  static ListTileThemeData _listTileTheme(AppColorScheme colorScheme) => ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        horizontalTitleGap: 16,
        dense: true,
        visualDensity: VisualDensity.compact,
      );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(AppColorScheme colorScheme) =>
      const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        backgroundColor: Colors.white,
      );

  static FilledButtonThemeData _filledButtonThemeData(AppColorScheme colorScheme) => FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSecondary;
            } else {
              return colorScheme.onPrimary;
            }
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.secondary;
            } else {
              return colorScheme.primary;
            }
          }),
          textStyle: WidgetStateProperty.all(AppTextTheme(colorScheme).bodyLarge),
          fixedSize: WidgetStateProperty.all(const Size(double.infinity, 56)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              side: BorderSide(color: colorScheme.shadow),
            ),
          ),
        ),
      );

  static DividerThemeData _dividerTheme(AppColorScheme colorScheme) => DividerThemeData(
        color: colorScheme.secondary,
        thickness: 0.2,
      );
}
