import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meezy_starter/core/ui_kit/src/widgets/shimmer_syncer.dart';

enum SgShimmerDirection { ltr, rtl, ttb, btt }

enum SgShimmerBackgroundType { primary, secondary }

class SgShimmer extends StatelessWidget {
  final Widget child;
  final SgShimmerDirection direction;
  final SgShimmerBackgroundType shimmerBackgroundType;
  final bool isLoading;
  final Duration animationCoolDown;
  final Duration animationDuration;

  const SgShimmer({
    required this.child,
    required this.isLoading,
    super.key,
    this.direction = SgShimmerDirection.ltr,
    this.shimmerBackgroundType = SgShimmerBackgroundType.primary,
    this.animationDuration = const Duration(milliseconds: 1200),
    this.animationCoolDown = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SgShimmerAnimationWidget(
        animationCooldown: animationCoolDown,
        animationDuration: animationDuration,
        type: shimmerBackgroundType,
        direction: direction,
        child: child,
      );
    } else {
      return child;
    }
  }
}

class SgShimmerAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration animationCooldown;
  final Duration animationDuration;
  final SgShimmerDirection direction;
  final SgShimmerBackgroundType type;
  const SgShimmerAnimationWidget({
    required this.animationCooldown,
    required this.animationDuration,
    required this.child,
    required this.direction,
    required this.type,
    super.key,
  });

  @override
  SgShimmerAnimationWidgetState createState() => SgShimmerAnimationWidgetState();
}

class SgShimmerAnimationWidgetState extends State<SgShimmerAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;
  Timer? _timer;

  late LinearGradient _currentGradient;
  bool isSynced = false;

  @override
  void didChangeDependencies() {
    final _syncController = ShimmerSyncer.of(context);
    isSynced = _syncController != null;
    _controller = (_syncController ?? AnimationController(vsync: this, duration: widget.animationDuration))
      ..addStatusListener(_statusListener);
    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
    initCurrentGradient(context);
    super.didChangeDependencies();
  }

  void initCurrentGradient(BuildContext context) {
    switch (widget.type) {
      case SgShimmerBackgroundType.primary:
        _currentGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF181818),
            Color(0xFF676973),
            Color(0xFF181818),
            Color(0xFF676973),
            Color(0xFF181818),
          ],
          stops: [0.4, 0.5, 0.7, 0.9, 1.0],
        );
      case SgShimmerBackgroundType.secondary:
        _currentGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF181818),
            Color(0xFF676973),
            Color(0xFF181818),
            Color(0xFF676973),
            Color(0xFF181818),
          ],
          stops: [0.4, 0.5, 0.7, 0.9, 1.0],
        );
    }
  }

  LinearGradient get gradient => LinearGradient(
        colors: _currentGradient.colors,
        stops: _currentGradient.stops,
        begin: _currentGradient.begin,
        end: _currentGradient.end,
        transform: _SlidingGradientTransform(slidePercent: _controller.value),
      );

  Future<void> _statusListener(AnimationStatus status) async {
    if (status == AnimationStatus.completed && mounted) {
      _timer = Timer(widget.animationCooldown, () {
        _controller.forward(from: 0.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _curvedAnimation,
        child: widget.child,
        builder: (BuildContext context, Widget? child) => _SgShimmerRenderObj(
          direction: widget.direction,
          gradient: gradient,
          percent: _controller.value,
          child: child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _timer?.cancel();
    if (!isSynced) _controller.dispose();
    super.dispose();
  }
}

@immutable
class _SgShimmerRenderObj extends SingleChildRenderObjectWidget {
  final double percent;
  final SgShimmerDirection direction;
  final Gradient gradient;

  const _SgShimmerRenderObj({
    required this.percent,
    required this.direction,
    required this.gradient,
    super.child,
  });

  @override
  ShimmerFilter createRenderObject(BuildContext context) {
    return ShimmerFilter(percent, direction, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, ShimmerFilter shimmer) {
    shimmer.percent = percent;
    shimmer.gradient = gradient;
    shimmer.direction = direction;
  }
}

class ShimmerFilter extends RenderProxyBox {
  SgShimmerDirection _direction;
  Gradient _gradient;
  double _percent;

  ShimmerFilter(this._percent, this._direction, this._gradient);

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  double get percent => _percent;

  set percent(double newValue) {
    if (newValue == _percent) {
      return;
    }
    _percent = newValue;
    markNeedsPaint();
  }

  Gradient get gradient => _gradient;

  set gradient(Gradient newValue) {
    if (newValue == _gradient) {
      return;
    }
    _gradient = newValue;
    markNeedsPaint();
  }

  SgShimmerDirection get direction => _direction;

  set direction(SgShimmerDirection newDirection) {
    if (newDirection == _direction) {
      return;
    }
    _direction = newDirection;
    markNeedsLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);
      final double width = child!.size.width;
      final double height = child!.size.height;
      Rect rect;
      double dx;
      double dy;
      if (_direction == SgShimmerDirection.rtl) {
        dx = _offset(width, -width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      } else if (_direction == SgShimmerDirection.ttb) {
        dx = 0.0;
        dy = _offset(-height, height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else if (_direction == SgShimmerDirection.btt) {
        dx = 0.0;
        dy = _offset(height, -height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else {
        dx = _offset(-width, width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      }
      layer ??= ShaderMaskLayer();
      layer!
        ..shader = _gradient.createShader(rect)
        ..maskRect = offset & size
        ..blendMode = BlendMode.srcIn;
      context.pushLayer(layer!, super.paint, offset);
    } else {
      layer = null;
    }
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
