import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';

class ProjectTheme {
  static ThemeData projectLightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: ProjectColors.primaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      primary: ProjectColors.primaryColor,
      background: Colors.white,
      seedColor: Colors.white,
      onSurface: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ProjectColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ProjectColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ProjectColors.primaryColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ProjectColors.primaryColor),
      ),
    ),
  );

  static ThemeData projecDarkTheme = ThemeData(
    scaffoldBackgroundColor: ProjectColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ProjectColors.primaryColor,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      primary: ProjectColors.primaryColor,
      background: ProjectColors.primaryColor,
      seedColor: ProjectColors.greyText,
      onSurface: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ProjectColors.greyText),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ProjectColors.greyText),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ProjectColors.greyText),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ProjectColors.greyText),
      ),
    ),
  );
}
