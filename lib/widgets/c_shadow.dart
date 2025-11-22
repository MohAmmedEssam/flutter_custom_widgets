import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? radius;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;

  const ShadowContainer(
      {super.key,
      required this.child,
      this.color,
      this.radius,
      this.borderSide,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.fromBorderSide(borderSide ?? BorderSide.none),
      ),
      child: child,
    );
  }
}
