import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(0, 182, 45, 113);
  static const Color secondary = Color.fromARGB(0, 165, 165, 190);
  static const Color background = Color.fromARGB(0, 76, 182, 161);
  static const Color textDark = Color.fromARGB(0, 121, 92, 188);

  static ThemeData LightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
    ),
    fontFamily: 'poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
  );
}





