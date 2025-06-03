import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

Future<ShaderCollection> buildShaderCollection() async {
  final waterColorBlending = await ui.FragmentProgram.fromAsset(
    'packages/meezy_ui/lib/src/shaders/glsl/water_color_blending.frag',
  );
  final circleWave = await ui.FragmentProgram.fromAsset(
    'packages/meezy_ui/lib/src/shaders/glsl/shockwave.frag',
  );
  final progressiveBlur = await ui.FragmentProgram.fromAsset(
    'packages/meezy_ui/lib/src/shaders/glsl/progressive_blur.frag',
  );

  ProgressiveBlurWidget.precache();

  return ShaderCollection(
    waterColorBlending: waterColorBlending,
    circleWave: circleWave,
    progressiveBlur: progressiveBlur,
  );
}

class ShaderProvider extends InheritedWidget {
  const ShaderProvider({
    super.key,
    required this.shader,
    required super.child,
  });

  final ShaderCollection shader;

  static ShaderCollection of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ShaderProvider>();
    return provider!.shader;
  }

  @override
  bool updateShouldNotify(covariant ShaderProvider oldWidget) {
    return oldWidget.shader != shader;
  }
}

class ShaderCollection {
  final ui.FragmentProgram waterColorBlending;
  final ui.FragmentProgram circleWave;
  final ui.FragmentProgram progressiveBlur;

  ShaderCollection({
    required this.waterColorBlending,
    required this.circleWave,
    required this.progressiveBlur,
  });
}
