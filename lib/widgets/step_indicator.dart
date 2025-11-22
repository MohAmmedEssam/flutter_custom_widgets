import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_text.dart';
import 'c_shadow.dart';
import '../ext/context_extension.dart';

class StepIndicator extends StatelessWidget {
  final List<int> steps;
  final int completedStep;

  const StepIndicator(
      {super.key, required this.steps, required this.completedStep});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var step in steps)
                Container(
                  color: context.colorScheme.surface,
                  width: (context.width / (steps.length * 3)),
                  height: (context.width / (steps.length * 3)),
                  child: ShadowContainer(
                    color: context.primaryColor
                        .withAlpha(step <= completedStep ? 250 : 20),
                    radius: context.fullHeight / 2,
                    child: CustomText(
                      text: '$step',
                      fontSize: HeaderStyle.h4,
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
