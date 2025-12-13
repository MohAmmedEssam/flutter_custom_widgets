import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class RowsPerColumn extends StatelessWidget {
  final List<Widget> children;
  final int numPerRow;

  const RowsPerColumn({
    super.key,
    required this.children,
    this.numPerRow = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        (children.length / numPerRow).ceil(),
        (index) {
          final startIndex = index * numPerRow;
          final cells = children.sublist(
            startIndex,
            (startIndex + numPerRow).clamp(0, children.length),
          );

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start, // ✅ TOP ALIGN
            children: cells.map((cell) {
              return Expanded(
                child: Padding(
                  padding: context.sfullPadding,
                  child: cell,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
