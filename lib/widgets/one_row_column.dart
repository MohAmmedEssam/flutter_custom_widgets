import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class OneRowPerColumn extends StatelessWidget {
  final List<Widget> children;
  final bool withSepartor;
  const OneRowPerColumn({
    super.key,
    this.withSepartor = false,
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    List<Widget> modifiedChildren = [];

    for (int i = 0; i < children.length; i++) {
      modifiedChildren.add(children[i]);
      if (withSepartor && i < (children.length - 1)) {
        modifiedChildren.add(SizedBox(height: context.vSpace * 0.5));
      }
      // Add separator if needed
      if (withSepartor && i < children.length - 1) {
        modifiedChildren.add(Container(
          color: Colors.grey,
          height: 0.5,
        ));
      }
      modifiedChildren.add(SizedBox(height: context.vSpace));
    }

    return Column(
      children: modifiedChildren,
    );
  }
}
