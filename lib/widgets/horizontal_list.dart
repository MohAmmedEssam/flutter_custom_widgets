import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class HorizontalList extends StatelessWidget {
  final List<Widget> children;
  const HorizontalList({
    super.key,
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    List<Widget> modifiedChildren = [];

    for (int i = 0; i < children.length; i++) {
      modifiedChildren.add(children[i]);
      if (i < (children.length - 1)) {
        modifiedChildren.add(SizedBox(width: context.hSpace));
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: modifiedChildren,
      ),
    );
  }
}
