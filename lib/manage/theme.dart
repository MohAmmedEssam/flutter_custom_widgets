import 'package:flutter/material.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData lightTheme(
          BuildContext context, Color primaryColor, Color secondaryColor) =>
      ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        elevatedButtonTheme: Styles.getElevatedButtonTheme(context),
        outlinedButtonTheme: Styles.getOutlinedButtonTheme(context),
      );

  static ThemeData darkTheme(
          BuildContext context, Color primaryColor, Color secondaryColor) =>
      ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        elevatedButtonTheme: Styles.getElevatedButtonTheme(context),
        outlinedButtonTheme: Styles.getOutlinedButtonTheme(context),
      );
}
