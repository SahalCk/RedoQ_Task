import 'package:flutter/material.dart';
import 'package:redoq/utils/constants/colors.dart';

class RedoqAppTheme {
  final _redoqThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: blackColor,
      background: backgroundColor,
      primary: blackColor,
      surfaceTint: backgroundColor,
      secondary: secondaryColor,
      primaryContainer: secondaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blackColor,
        foregroundColor: Colors.white,
      ),
    ),
    useMaterial3: true,
    textTheme: const TextTheme(),
    fontFamily: 'Poppins',
  );

  ThemeData get getThemeData => _redoqThemeData;
}
