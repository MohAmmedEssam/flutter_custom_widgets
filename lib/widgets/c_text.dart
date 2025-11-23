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
  final int? maxLines;
  final TextStyle? style;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? fontDoubleSize;
  final TextOverflow? overflow;
  const CustomText({
    super.key,
    this.text = '',
    this.fontSize = HeaderStyle.h3,
    this.alignment,
    this.textAlign,
    this.color,
    this.customValue,
    this.maxLines,
    this.style,
    this.decoration,
    this.fontWeight,
    this.fontDoubleSize,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    // Base style from HeaderStyle
    var baseStyle = context.font(fontSize).copyWith(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontDoubleSize,
        );
    if (decoration != null) {
      baseStyle = baseStyle.copyWith(decoration: decoration);
    }

    return Container(
        alignment: alignment ?? context.preferredAlignment,
        child: Text(
          text.tr.replaceAll('%@', customValue?.tr ?? ''),
          style: style ?? baseStyle,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
        ));
  }
}
