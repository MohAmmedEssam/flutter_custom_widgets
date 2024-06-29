import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loader.dart';
import '../ext/context_extension.dart';

enum WidgetStatus {
  isLoading,
  isEmpty,
  isOk,
}

class WidgetsAnimator extends StatelessWidget {
  final WidgetStatus status;
  final Widget widget;

  const WidgetsAnimator(
      {super.key, required this.status, required this.widget});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: context.animationDuration,
      transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
      child: () {
        switch (status) {
          case WidgetStatus.isLoading:
            return const Loader();
          case WidgetStatus.isEmpty:
            return Center(
                child: Image.asset(
              "assets/images/nodata.png",
              width: context.fullWidth * 0.5,
            ));
          case WidgetStatus.isOk:
            return widget;
        }
      }(),
    );
  }
}
