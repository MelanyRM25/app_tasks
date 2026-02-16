import 'package:flutter/material.dart';

class AppTheme {
  ///Tema Light
  static const Color _lightPrimaryColor = Color(0xFF7a4df8);
  static const Color _lightPrimaryVariantColor = Color(0xFFc089ff);

  static const Color _lightBackgroundColor = Colors.white;
  static const Color _lightTextColor = Colors.white;

  //Tema Dark
  static const Color _darkPrimaryColor = Color(0xFF7a4df8);
  static const Color _darkPrimaryVariantColor = Color(0xFFc089ff);

  static const Color _darkBackgroundColor = Color(0xFF1A1A1A);
  static const Color _darkTextColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightPrimaryVariantColor,
      secondary: _lightBackgroundColor,
      onSecondary: _lightTextColor,
    ),
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurpleAccent,
      ),
      foregroundColor: Colors.deepPurpleAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightPrimaryColor,
        foregroundColor: _lightTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkPrimaryVariantColor,
      secondary: _darkBackgroundColor,
      onSecondary: _darkTextColor,
    ),
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurpleAccent,
      ),
      foregroundColor: _darkTextColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkPrimaryColor,
        foregroundColor: _darkTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}
