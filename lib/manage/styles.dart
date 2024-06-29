import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class Styles {
  //ElevatedButton
  static ElevatedButtonThemeData getElevatedButtonTheme(BuildContext context) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
        ),
      );
  //ElevatedButton
  static OutlinedButtonThemeData getOutlinedButtonTheme(BuildContext context) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: context.primaryColor),
        ),
      );
}
