import 'package:flutter/material.dart';

class SlideBounceAnimation extends StatefulWidget {
  const SlideBounceAnimation({
    required this.alignment,
    required this.controller,
    required this.child,
    super.key,
  });

  final AlignmentGeometry alignment;
  final AnimationController controller;
  final Widget child;

  @override
  State<SlideBounceAnimation> createState() => _SlideBounceAnimationState();
}

class _SlideBounceAnimationState extends State<SlideBounceAnimation> with TickerProviderStateMixin {
  late Tween<Offset> _tween;
  late CurvedAnimation _animation;

  @override
  void initState() {
    _animation = CurvedAnimation(parent: widget.controller, curve: Curves.easeInOutBack);
    _dealContentAnimate();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlideBounceAnimation oldWidget) {
    if (oldWidget.child != widget.child) _dealContentAnimate();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _tween.animate(_animation),
      child: widget.child,
    );
  }

  void _dealContentAnimate() {
    final AlignmentGeometry alignment = widget.alignment;
    var offset = Offset.zero;

    switch (alignment) {
      case Alignment.bottomCenter:
        offset = const Offset(0, 1);
      case Alignment.bottomLeft:
        offset = const Offset(0, 1);
      case Alignment.bottomRight:
        offset = const Offset(0, 1);
      case Alignment.topCenter:
        offset = const Offset(0, -1);
      case Alignment.topLeft:
        offset = const Offset(0, -1);
      case Alignment.topRight:
        offset = const Offset(0, -1);
      case Alignment.centerLeft:
        offset = const Offset(1, 0);
      case Alignment.centerRight:
        offset = const Offset(1, 0);
      default:
        break;
    }

    _tween = Tween<Offset>(begin: offset, end: Offset.zero);
  }
}
