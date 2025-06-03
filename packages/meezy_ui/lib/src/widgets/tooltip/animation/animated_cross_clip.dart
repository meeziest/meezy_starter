import 'package:flutter/widgets.dart';

import '../tooltip.dart';

enum CrossClipState {
  mask,
  unmask,
}

class AnimatedCrossClip extends StatefulWidget {
  const AnimatedCrossClip({
    super.key,
    required this.child,
    this.crossClipState = CrossClipState.mask,
    this.duration = AnimatedCrossClip.defaultDuration,
    this.pathBuilder = PathBuilders.circleIn,
    this.curve = Curves.linear,
    this.clipBehavior = Clip.antiAlias,
    this.fit = StackFit.loose,
    this.position = TooltipPosition.topStart,
    this.controller,
    this.withFade = true,
  });

  final Widget child;
  final Duration duration;
  final PathBuilder pathBuilder;
  final Curve curve;
  final Clip clipBehavior;
  final StackFit fit;
  final CrossClipState crossClipState;
  final TooltipPosition position;
  final AnimationController? controller;
  final bool withFade;

  static const Duration defaultDuration = Duration(milliseconds: 450);

  @override
  AnimatedCrossClipState createState() => AnimatedCrossClipState();
}

class AnimatedCrossClipState extends State<AnimatedCrossClip> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _controller = widget.controller ?? AnimationController(duration: widget.duration, vsync: this);
    _controller.value = widget.crossClipState == CrossClipState.mask ? 0 : 1;
    final animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(animation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedCrossClip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.crossClipState != oldWidget.crossClipState) {
      switch (widget.crossClipState) {
        case CrossClipState.mask:
          _controller.reverse();
        case CrossClipState.unmask:
          _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.withFade
        ? FadeTransition(
            opacity: _fadeAnimation,
            child: ClipPathTransition(
              animation: _controller.drive(CurveTween(curve: widget.curve)),
              pathBuilder: widget.pathBuilder,
              clipBehavior: widget.clipBehavior,
              position: widget.position,
              child: widget.child,
            ),
          )
        : ClipPathTransition(
            animation: _controller.drive(CurveTween(curve: widget.curve)),
            pathBuilder: widget.pathBuilder,
            clipBehavior: widget.clipBehavior,
            position: widget.position,
            child: widget.child,
          );
  }
}
