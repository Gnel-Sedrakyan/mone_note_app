import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/core/constants/colors.dart';
import 'package:mone_note_app/presentation/core/constants/defalut_values.dart';

class AppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'Nunito';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
          fontFamily: fontName,
          color: textColorDarkTheme,
          fontSize: 43,
          fontWeight: FontWeight.w600),
      titleLarge: base.titleLarge?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontFamily: fontName,
        color: textColorDarkTheme,
      ),
    );
  }

  //TODO add context to params and build text theme sizes depending on mediaquery
  static ThemeData buildDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      background: bgColorDarkTheme,
      surface: surfaceColorDarkTheme,
      onSurface: onSurfaceColorDarkTheme,
    );

    final ThemeData baseThemeData = ThemeData.dark();
    return baseThemeData.copyWith(
      shadowColor: defaultShadowColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: bgColorDarkTheme,
        foregroundColor: textColorDarkTheme,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: bgColorDarkTheme,
        foregroundColor: textColorDarkTheme,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      colorScheme: colorScheme,
      indicatorColor: bgColorDarkTheme,
      splashColor: bgColorDarkTheme,
      splashFactory: InkRipple.splashFactory,
      canvasColor: bgColorDarkTheme,
      scaffoldBackgroundColor: bgColorDarkTheme,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            side: const BorderSide(color: Colors.red)),
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(baseThemeData.textTheme),
      primaryTextTheme: _buildTextTheme(baseThemeData.primaryTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
