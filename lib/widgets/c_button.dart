import 'package:flutter/material.dart';

import 'c_text.dart';
import '../ext/context_extension.dart';

enum CustomButtonStyle { main, secondary }

class CustomButton extends StatelessWidget {
  final String text;
  final CustomButtonStyle style;
  final VoidCallback? onPressed;
  final String? customValue;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.customValue,
    this.style = CustomButtonStyle.main,
  });

  @override
  Widget build(BuildContext context) {
    if (style == CustomButtonStyle.main) {
      return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: context.sfullPadding,
          child: CustomText(
              text: text,
              customValue: customValue,
              fontSize: HeaderStyle.h3,
              color: Colors.white,
              alignment: Alignment.center),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        child: Padding(
          padding: context.sfullPadding,
          child: CustomText(
              text: text,
              customValue: customValue,
              fontSize: HeaderStyle.h3,
              color: context.primaryColor,
              alignment: Alignment.center),
        ),
      );
    }
  }
}
