import 'package:flutter/material.dart';

class AppTheme {
  static const Color bgColor = Color(0xFF0B0B0B);
  static const Color cardColor = Color(0xFF1A1A1A);
  static const Color primaryBlue = Color(0xFF00B8FF);
  static const Color textWhite = Colors.white;
  static const Color textGrey = Color(0xFF9A9A9A);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: bgColor,
    brightness: Brightness.dark,
    fontFamily: "Roboto",
    appBarTheme: const AppBarTheme(
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: true,
    ),
  );
}