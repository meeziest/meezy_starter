import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../../shaders/shaders_provider.dart';
import 'switcher_zone.dart';

class ShockWaveArea extends StatefulWidget {
  const ShockWaveArea({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.mixFactor = 5.0,
  });

  final Widget child;
  final Duration duration;
  final double mixFactor;

  @override
  State<ShockWaveArea> createState() => _ShockWaveAreaState();
}

class _ShockWaveAreaState extends State<ShockWaveArea> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  SwitcherController? _switcherController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant ShockWaveArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _switcherController?.removeListener(_onListen);
    _switcherController = SwitcherInheritedNotifier.of(context);
    _switcherController?.addListener(_onListen);
  }

  void _onListen() async {
    _controller.forward(from: 0.0).then((value) {
      _switcherController?.isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = _switcherController ?? SwitcherInheritedNotifier.of(context);
    final shader = ShaderProvider.of(context).circleWave.fragmentShader();
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return AnimatedSampler(
          enabled: controller.isAnimating && controller.oldImage != null,
          (ui.Image newThemeTexture, Size size, Canvas canvas) {
            shader.setFloat(0, _controller.value); // iTime
            shader.setFloat(1, size.width * devicePixelRatio); // iResolution.x
            shader.setFloat(2, size.height * devicePixelRatio); // iResolution.y
            shader.setFloat(3, controller.switcherOffset.dx * devicePixelRatio);
            shader.setFloat(4, controller.switcherOffset.dy * devicePixelRatio);
            shader.setFloat(5, widget.mixFactor); // circle mix factor
            shader.setImageSampler(0, controller.oldImage!); // iChannel0
            shader.setImageSampler(1, newThemeTexture); // iChannel1

            final paint = Paint()..shader = shader;
            canvas.drawRect(Offset.zero & size, paint);
          },
          child: widget.child,
        );
      },
    );
  }
}
