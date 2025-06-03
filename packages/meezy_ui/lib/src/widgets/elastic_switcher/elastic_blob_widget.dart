import 'dart:math';

import 'package:flutter/material.dart';

import 'animations.dart';
import 'blob_painter.dart';

class ElasticBlob extends StatefulWidget {
  const ElasticBlob({
    super.key,
    double? maxStretchSize,
    double? maxStretchDistance,
    required this.radius,
    required this.blobOnWidget,
    required this.blobOffWidget,
    this.duration,
    this.color,
    this.onPanEnd,
  })  : maxStretchSize = maxStretchSize ?? radius * 2,
        maxStretchDistance = maxStretchDistance ?? radius * 20;

  final double maxStretchSize;
  final double maxStretchDistance;
  final double radius;
  final Color? color;
  final Duration? duration;

  final Widget blobOnWidget;
  final Widget blobOffWidget;

  final VoidCallback? onPanEnd;

  @override
  State<ElasticBlob> createState() => _ElasticBlobState();
}

class _ElasticBlobState extends State<ElasticBlob> {
  double _rotationAngle = 0;
  Offset _blobCenter = Offset.zero;
  Offset _pointerPosition = Offset.zero;
  double _stretchFactor = 1.0;
  double _stretchDistance = 0;

  /// Computes the angle between the icon’s center and the pointer's position.
  double _computeRotationAngle(Offset center, Offset pointer) {
    final dx = pointer.dx - center.dx;
    final dy = pointer.dy - center.dy;
    return atan2(dy, dx);
  }

  /// Resets the stretch factor and distance on pan start.
  void _onPanStart(DragDownDetails details) {
    setState(() {
      _stretchFactor = 1.0;
      _stretchDistance = 0;
    });
  }

  /// Updates the rotation and stretch properties as the user drags.
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _pointerPosition = details.globalPosition;
      _updateBlobTransformations();
    });
  }

  /// Resets the stretch properties when the user releases the drag.
  void _onPanEnd(DragEndDetails details) {
    final renderBox = context.findRenderObject() as RenderBox;
    if (_stretchDistance >= renderBox.size.height * 2) {
      widget.onPanEnd?.call();
    }

    setState(() {
      _stretchFactor = 1.0;
      _stretchDistance = 0;
    });
  }

  /// Updates the icon's center, rotation angle, and stretch properties.
  void _updateBlobTransformations() {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      _blobCenter = renderBox.localToGlobal(renderBox.size.center(Offset.zero));

      _rotationAngle = _computeRotationAngle(_blobCenter, _pointerPosition);
      _stretchDistance = (_pointerPosition - _blobCenter).distance.clamp(0, widget.maxStretchDistance);

      _calculateStretchFactor(renderBox);
    }
  }

  /// Calculates the stretch factor based on the drag distance and widget size.
  void _calculateStretchFactor(RenderBox renderBox) {
    final adjustedStretchLength = renderBox.size.height + _stretchDistance.clamp(0, widget.maxStretchSize);

    if (adjustedStretchLength <= renderBox.size.height * 1.5) {
      _stretchFactor = 1.0;
      _stretchDistance = 0;
    } else {
      final mappedScale = adjustedStretchLength / renderBox.size.height;
      _stretchFactor = 1 + 0.4 * log(mappedScale);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StretchTweenAnimationBuilder(
      stretchFactor: _stretchFactor,
      duration: widget.duration ?? const Duration(milliseconds: 700),
      builder: (context, stretchFactor, _) {
        return TranslateTweenAnimationBuilder(
          stretchDistance: _stretchDistance,
          duration: widget.duration ?? const Duration(milliseconds: 700),
          builder: (context, stretchDistance, _) {
            return GestureDetector(
              onPanDown: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Stack(
                // The icon stack with the main icon, painter, and clipper layers.
                children: [
                  Positioned.fill(
                    child: widget.blobOnWidget,
                  ),
                  CustomPaint(
                    size: Size(widget.radius * 2, widget.radius * 2),
                    painter: BlobPainter(
                      color: widget.color ?? theme.colorScheme.primary,
                      radius: widget.radius,
                      radians: _rotationAngle,
                      stretchScale: stretchFactor,
                      stretchDistance: stretchDistance,
                    ),
                  ),
                  Positioned.fill(
                    child: ClipPath(
                      clipper: BlobClipper(
                        radius: widget.radius,
                        radians: _rotationAngle,
                        stretchScale: stretchFactor,
                        stretchDistance: stretchDistance,
                      ),
                      child: widget.blobOffWidget,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
