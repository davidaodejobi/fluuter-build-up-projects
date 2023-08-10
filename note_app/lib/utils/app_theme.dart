import 'package:flutter/material.dart';
import 'package:note_app/constants/app_colors.dart';

class AppTheme {
  static const String _fontName = 'Nunito';

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 96.0,
        fontWeight: FontWeight.bold,
        // color: AppColors.textColor,
      ),
      displayMedium: TextStyle(
        fontSize: 43.0,
        fontWeight: FontWeight.normal,
        // color: AppColors.textColor,
      ),
      displaySmall: TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.w500,
        // color: AppColors.textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        color: AppColors.alertTextColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        // color: AppColors.textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        // color: AppColors.textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        // color: AppColors.textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.alertTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        // color: AppColors.textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        // color: AppColors.textColor,
      ),
      labelSmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        // color: AppColors.textColor,
      ),
    ).apply(
      fontFamily: _fontName,
    );
  }

  static darkMode() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.backgroundColor,
        elevation: 20,
        iconSize: 34,
        foregroundColor: Colors.white,
      ),
      // primaryColor: Colors.black,
      fontFamily: _fontName,
      textTheme: _buildTextTheme(),
    );
  }
}
