import 'package:flutter/material.dart';

import 'c_text.dart';
import '../ext/context_extension.dart';

enum CustomButtonStyle { main, secondary }

class CustomButton extends StatelessWidget {
  final String text;
  final CustomButtonStyle style;
  final VoidCallback? onPressed;
  final String? customValue;
  final FontWeight? fontWeight;
  final HeaderStyle fontSize;
  final double? fontDoubleSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.customValue,
    this.style = CustomButtonStyle.main,
    this.fontWeight,
    this.fontSize = HeaderStyle.h3,
    this.fontDoubleSize,
  });

  @override
  Widget build(BuildContext context) {
    if (style == CustomButtonStyle.main) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
        ),
        child: Padding(
          padding: context.sfullPadding,
          child: CustomText(
              text: text,
              customValue: customValue,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: Colors.white,
              alignment: Alignment.center),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: context.primaryColor),
        ),
        child: Padding(
          padding: context.sfullPadding,
          child: CustomText(
              text: text,
              customValue: customValue,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontDoubleSize: fontDoubleSize,
              color: context.primaryColor,
              alignment: Alignment.center),
        ),
      );
    }
  }
}
