import 'package:flutter/material.dart';
import 'package:redoq/utils/constants/colors.dart';

class RedoqAppTheme {
  static ThemeData getThemeData(Color seedColor) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        background: seedColor == blackColor
            ? lightThemeBackgroundColor
            : darkThemeBackgroundColor,
        primary: seedColor,
        surfaceTint: seedColor == blackColor
            ? lightThemeBackgroundColor
            : darkThemeBackgroundColor,
        secondary: seedColor == blackColor
            ? lightThemeSecondaryColor
            : darkThemeSecondaryColor,
        primaryContainer: seedColor == blackColor
            ? lightThemeSecondaryColor
            : darkThemeSecondaryColor,
        brightness:
            seedColor == blackColor ? Brightness.light : Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: seedColor == blackColor
            ? lightThemeBackgroundColor
            : darkThemeBackgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: seedColor,
          foregroundColor:
              seedColor == blackColor ? Colors.white : Colors.black,
        ),
      ),
      useMaterial3: true,
      textTheme: const TextTheme(),
      fontFamily: 'Poppins',
    );
  }

  static final lightTheme = getThemeData(blackColor);
  static final darkTheme = getThemeData(whiteColor);
}
