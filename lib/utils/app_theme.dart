import 'package:recipe_app_flutter/utils/app_textstyle.dart';
import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    primarySwatch: primaryColorSwatch,
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
    fontFamily: customFont.fontFamily,
    textTheme: AppTextStyle.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    ),
  );
}
