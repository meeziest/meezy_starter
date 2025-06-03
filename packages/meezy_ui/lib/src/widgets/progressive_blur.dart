import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

/// A widget that applies a progressive blur effect to its child.
///
/// Simplest way to use it is to use the default constructor and provide a
/// [LinearGradientBlur] object. See the documentation of that class for
/// more information.
///
/// Alternatively, you can apply the blur as a blur texture via the `.custom()`
/// constructor. The blur texture can be thought of as a strength map for the
/// blur (`final_sigma = sigma * texture(x, y).r`). You can supply your own blur
/// texture to create custom blur effects.
///
/// The blur is applied in two passes: first horizontally and then vertically.
///
/// The blur shader should be precached before using this widget to avoid a
/// pop-in effect. You can do this by calling [ProgressiveBlurWidget.precache] as
/// early as possible in your app (e.g. in `main()`).
class ProgressiveBlurWidget extends StatefulWidget {
  const ProgressiveBlurWidget({
    super.key,
    required this.linearGradientBlur,
    required this.sigma,
    required this.child,
    this.blurTextureDimensions = 128,
  }) : blurTexture = null;

  const ProgressiveBlurWidget.custom({
    super.key,
    required this.blurTexture,
    required this.sigma,
    required this.child,
  })  : linearGradientBlur = null,
        // Irrelevant in case of a custom blur texture
        blurTextureDimensions = -1;

  /// Asset key of the shader.
  static const _shaderAssetKey = 'packages/meezy_ui/lib/src/shaders/glsl/progressive_blur.frag';

  /// Precaches the blur shader so that it can be used synchronously later.
  /// This should be called as early as possible in your app (e.g. in `main()`).
  static Future<void> precache() {
    return ShaderBuilder.precacheShader(_shaderAssetKey);
  }

  /// A simple constructor that allows to specify a linear gradient blur.
  final LinearGradientBlur? linearGradientBlur;

  /// Dimensions of the blur texture. If not provided, it will be set to 128.
  ///
  /// If you notice that the blur appears to be blocky, you can try increasing
  /// this value.
  final int blurTextureDimensions;

  /// The blur texture to be used as the blur strength map.
  final ui.Image? blurTexture;

  /// The standard deviation of the Gaussian blur.
  final double sigma;

  /// The widget to be blurred.
  final Widget child;

  @override
  State<ProgressiveBlurWidget> createState() => _ProgressiveBlurWidgetState();
}

class _ProgressiveBlurWidgetState extends State<ProgressiveBlurWidget> {
  /// The blur texture that this widget manages.
  ui.Image? _managedBlurTexture;

  @override
  void initState() {
    super.initState();
    _maybeCreateBlurTexture();
  }

  /// Disposes of the old blur texture and creates a new one if necessary.
  void _maybeCreateBlurTexture() {
    _managedBlurTexture?.dispose();

    if (widget.linearGradientBlur != null) {
      _managedBlurTexture = widget.linearGradientBlur!.createTexture(
        width: widget.blurTextureDimensions,
        height: widget.blurTextureDimensions,
      );
    }
  }

  @override
  void didUpdateWidget(covariant ProgressiveBlurWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.blurTexture != null && oldWidget.blurTexture == null) {
      _managedBlurTexture?.dispose();
      _managedBlurTexture = null;
      return;
    }

    var shouldCreateBlurTexture = false;

    if (widget.blurTextureDimensions != oldWidget.blurTextureDimensions) {
      shouldCreateBlurTexture = true;
    }

    if (widget.linearGradientBlur != oldWidget.linearGradientBlur) {
      shouldCreateBlurTexture = true;
    }

    if (shouldCreateBlurTexture) {
      _maybeCreateBlurTexture();
    }
  }

  @override
  void dispose() {
    _managedBlurTexture?.dispose();
    super.dispose();
  }

  ui.Image get blurTexture => widget.blurTexture ?? _managedBlurTexture!;

  @override
  Widget build(BuildContext context) {
    // The output texture should be scaled by the device pixel ratio.
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    return RepaintBoundary(
      child: ShaderBuilder(
        (context, shader, child) {
          return AnimatedSampler(
            (image, size, canvas) {
              final scaledSize = size * devicePixelRatio;

              // First do X-axis pass
              final firstPassRecorder = ui.PictureRecorder();
              final firstPassCanvas = Canvas(firstPassRecorder);

              shader.setImageSampler(0, image); // child_texture
              shader.setImageSampler(1, blurTexture); // blur_texture

              shader.setFloat(0, scaledSize.width); // child_size.x
              shader.setFloat(1, scaledSize.height); // child_size.y
              shader.setFloat(2, widget.sigma); // blur_sigma
              shader.setFloat(3, 0.0); // blur_direction

              // Draw the first pass
              final paint = Paint()..shader = shader;
              firstPassCanvas.drawRect(Offset.zero & scaledSize, paint);

              // End the first pass and get the image reference
              final firstPassPicture = firstPassRecorder.endRecording();
              final firstPassImage = firstPassPicture.toImageSync(
                scaledSize.width.toInt(),
                scaledSize.height.toInt(),
              );

              // Then do Y-axis pass
              shader.setImageSampler(0, firstPassImage); // child_texture
              shader.setFloat(3, 1.0); // blur_direction

              // Scale the canvas back so that we can apply the pixel ratio
              // scaling.
              canvas.scale(1 / devicePixelRatio);
              canvas.drawRect(Offset.zero & scaledSize, paint);

              // Dispose the first pass resources.
              firstPassPicture.dispose();
              firstPassImage.dispose();
            },
            child: child!,
          );
        },
        assetKey: ProgressiveBlurWidget._shaderAssetKey,
        child: widget.child,
      ),
    );
  }
}

/// Parameters to use to create a blur texture for the [ProgressiveBlurWidget].
///
/// By itself it can only create a linear gradient blur. For more complex blur
/// effects, you can create a custom blur texture and provide it to the widget.
class LinearGradientBlur {
  const LinearGradientBlur({
    required this.values,
    required this.stops,
    required this.start,
    required this.end,
  });

  /// List of values to be used in the gradient. 1.0 represents maximum blur,
  /// 0.0 represents no blur.
  final List<double> values;

  /// List of stops to be used in the gradient. Must be the same length as
  /// [values].
  final List<double> stops;

  /// The alignment of the start of the gradient.
  final Alignment start;

  /// The alignment of the end of the gradient.
  final Alignment end;

  /// Creates the blur texture. By default, width and height are set to 128.
  ui.Image createTexture({int width = 128, int height = 128}) {
    final size = Size(width.toDouble(), height.toDouble());
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);

    final gradient = ui.Gradient.linear(
      start.alongSize(size),
      end.alongSize(size),
      values.map((v) => Color.fromARGB(255, (v * 255).round(), 0, 0)).toList(),
      stops,
    );

    final paint = ui.Paint()..shader = gradient;
    canvas.drawRect(Offset.zero & size, paint);

    final picture = recorder.endRecording();
    final image = picture.toImageSync(width, height);

    return image;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LinearGradientBlur &&
        listEquals(other.values, values) &&
        listEquals(other.stops, stops) &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode => Object.hashAll([...values, ...stops, start, end]);
}
