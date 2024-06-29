import 'package:flutter/material.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context, Color primaryColor) =>
      ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        elevatedButtonTheme: Styles.getElevatedButtonTheme(context),
        outlinedButtonTheme: Styles.getOutlinedButtonTheme(context),
      );

  static ThemeData darkTheme(BuildContext context, Color primaryColor) =>
      ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
        ),
        elevatedButtonTheme: Styles.getElevatedButtonTheme(context),
        outlinedButtonTheme: Styles.getOutlinedButtonTheme(context),
      );
}
