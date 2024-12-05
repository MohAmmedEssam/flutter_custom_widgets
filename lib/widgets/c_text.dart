import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? customValue;
  final HeaderStyle fontSize;
  final Alignment? alignment;
  final TextAlign? textAlign;
  final Color? color;

  const CustomText({
    super.key,
    this.text = '',
    this.fontSize = HeaderStyle.h3,
    this.alignment,
    this.textAlign,
    this.color,
    this.customValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment ?? context.preferredAlignment,
        child: Text(
          text.tr.replaceAll('%@', customValue?.tr ?? ''),
          style: context.font(fontSize).copyWith(color: color),
          textAlign: textAlign,
        ));
  }
}
