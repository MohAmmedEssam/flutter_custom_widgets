import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_text.dart';
import 'c_shadow.dart';
import '../ext/context_extension.dart';

class StepIndicator extends StatelessWidget {
  final List<String> steps;
  final int completedStep;

  const StepIndicator({
    super.key,
    required this.steps,
    required this.completedStep,
  });

  @override
  Widget build(BuildContext context) {
    final stepWidth = context.width / (steps.length * 3);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: (stepWidth / 2),
          left: (stepWidth / 2),
          right: (stepWidth / 2),
          child: Expanded(
            child: Container(height: 2, color: Colors.grey.shade400),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps
              .asMap()
              .entries
              .map(
                (e) => Column(
                  children: [
                    Container(
                      color: context.colorScheme.surface,
                      width: stepWidth,
                      height: stepWidth,
                      child: ShadowContainer(
                        color: context.primaryColor.withAlpha(
                          (e.key + 1) <= completedStep ? 250 : 120,
                        ),
                        radius: context.fullHeight / 2,
                        child: CustomText(
                          text: '${(e.key + 1)}',
                          fontSize: HeaderStyle.h4,
                          fontWeight: FontWeight.bold,
                          alignment: Alignment.center,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: context.vSpace),
                    CustomText(
                      text: e.value,
                      fontSize: HeaderStyle.h5,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
