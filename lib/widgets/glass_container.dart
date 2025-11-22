import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: context.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withAlpha(20),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias, // ✨ clip child widgets
        child: child,
      ),
    );
  }
}
