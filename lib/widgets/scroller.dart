import 'package:flutter/material.dart';

class Scroller extends StatefulWidget {
  final Widget child;
  final Axis scrollDirection;
  final VoidCallback? onReachedBottom;

  const Scroller({
    super.key,
    required this.child,
    this.onReachedBottom,
    this.scrollDirection = Axis.vertical,
  });

  @override
  ScrollerState createState() => ScrollerState();
}

class ScrollerState extends State<Scroller> {
  final ScrollController _scrollController = ScrollController();
  bool _reachedBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      (widget.onReachedBottom != null && !_reachedBottom)
          ? widget.onReachedBottom!()
          : null;
      _reachedBottom = true;
    } else {
      _reachedBottom = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: widget.scrollDirection,
      child: widget.child,
    );
  }
}
