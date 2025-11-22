import 'package:flutter/material.dart';
import '../ext/context_extension.dart';
import 'gradient_background.dart';
import 'glass_container.dart';

class BaseContainer extends StatelessWidget {
  final Widget body;
  final Color? color;
  final Widget? backWidget;

  const BaseContainer({
    super.key,
    required this.body,
    this.color = Colors.white,
    this.backWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
        child: Stack(
          children: [
            if (backWidget != null) backWidget!,
            SafeArea(
              child: Padding(padding: context.hPadding, child: body),
            ),
          ],
        ),
      ),
    );
  }
}

class BaseBackgroundContainer extends StatelessWidget {
  final Widget body;
  final List<Color>? colors;

  const BaseBackgroundContainer({super.key, required this.body, this.colors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: colors ??
            [
              context.colorScheme.primary.withAlpha(70),
              context.colorScheme.surface,
              context.colorScheme.surface,
            ],
        child: SafeArea(
          child: Padding(padding: context.hPadding, child: body),
        ),
      ),
    );
  }
}

class BaseBackgroundGlasssedContainer extends StatelessWidget {
  final Widget body;
  const BaseBackgroundGlasssedContainer({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return BaseBackgroundContainer(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.maxWidthNeeded),
              child: GlassContainer(child: body),
            ),
          );
        },
      ),
    );
  }
}

class BaseBackgroundGlasssedScrolledContainer extends StatelessWidget {
  final List<Widget> children;
  const BaseBackgroundGlasssedScrolledContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBackgroundGlasssedContainer(
      body: SingleChildScrollView(
        padding: context.fullPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
