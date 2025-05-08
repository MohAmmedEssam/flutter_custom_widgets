import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum HeaderStyle { h1, h2, h3, h4, h5, h6 }

extension ContextExtension on BuildContext {
  // full scale
  double get fullWidth => MediaQuery.of(this).size.width;
  double get fullHeight => MediaQuery.of(this).size.height;
  double get maxWidthNeeded => min(fullWidth, 500);

  // spaces
  double get hSpace => fullWidth * 0.03;
  double get vSpace => fullHeight * 0.02;

  // Insets
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: hSpace);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: vSpace);
  EdgeInsets get fullPadding =>
      EdgeInsets.symmetric(horizontal: hSpace, vertical: vSpace);
  EdgeInsets get sfullPadding =>
      EdgeInsets.symmetric(horizontal: hSpace * 0.5, vertical: vSpace * 0.5);

  // colors
  Color get primaryColor => colorScheme.primary;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // languageCode
  String get languageCode =>
      Get.locale?.languageCode ?? Localizations.localeOf(this).languageCode;

  // Alignment
  Alignment get preferredAlignment =>
      languageCode == 'ar' ? Alignment.centerRight : Alignment.centerLeft;
  TextAlign get preferredTextAlign =>
      languageCode == 'ar' ? TextAlign.right : TextAlign.left;

  // animation
  Duration get animationDuration => const Duration(milliseconds: 200);

  // Text
  TextStyle font(HeaderStyle style) {
    double screenWidth = maxWidthNeeded;
    double fontSize;
    FontWeight fontWeight;

    switch (style) {
      case HeaderStyle.h1:
        fontSize = screenWidth * 0.05;
        fontWeight = FontWeight.bold;
        break;
      case HeaderStyle.h2:
        fontSize = screenWidth * 0.045;
        fontWeight = FontWeight.w600;
        break;
      case HeaderStyle.h3:
        fontSize = screenWidth * 0.04;
        fontWeight = FontWeight.w500;
        break;
      case HeaderStyle.h4:
        fontSize = screenWidth * 0.035;
        fontWeight = FontWeight.normal;
        break;
      case HeaderStyle.h5:
        fontSize = screenWidth * 0.03;
        fontWeight = FontWeight.normal;
        break;
      case HeaderStyle.h6:
        fontSize = screenWidth * 0.025;
        fontWeight = FontWeight.normal;
        break;
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'fontFamily'.tr,
    );
  }
}
