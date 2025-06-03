import 'package:flutter/material.dart';

import 'models/element_box.dart';
import 'models/elements_display.dart';
import 'models/enum/tooltip_position.dart';

/// Small deviations of tooltip position (both in x and y axis) to look more reliable on screen.
const _startDeviation = 0;
const _endDeviation = 0;

/// Calculates the position of the tooltip and the arrow on the screen
/// Verifies if the desired position fits the screen.
/// If it doesn't the position changes automatically.
class PositionManager {
  final ElementBox arrowBox;
  final ElementBox triggerBox;
  final ElementBox overlayBox;
  final ElementBox screenSize;

  /// [distance] between the tooltip and the trigger button.
  final double distance;

  /// [radius] border radius amount of the tooltip.
  final double radius;

  final bool autoFitScreen;

  PositionManager({
    required this.arrowBox,
    required this.triggerBox,
    required this.overlayBox,
    required this.screenSize,
    this.distance = 0.0,
    this.radius = 0.0,
    this.autoFitScreen = false,
  });

  ToolTipElementsDisplay _topStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _endDeviation,
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: TooltipPosition.topStart,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _topCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(arrowBox.w)).floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _half(overlayBox.w),
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: TooltipPosition.topCenter,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _topEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - arrowBox.w).floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.w + _half(triggerBox.w) + _startDeviation,
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: TooltipPosition.topEnd,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _bottomStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).ceilToDouble(),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _endDeviation,
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: TooltipPosition.bottomStart,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _bottomCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(arrowBox.w)).ceilToDouble(),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _half(overlayBox.w),
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: TooltipPosition.bottomCenter,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _bottomEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - arrowBox.w,
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - overlayBox.w + _startDeviation,
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: TooltipPosition.bottomEnd,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _leftStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h).floorToDouble(),
        y: triggerBox.y + _half(triggerBox.h),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - _endDeviation,
      ),
      position: TooltipPosition.leftStart,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _leftCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - _half(arrowBox.w)).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - _half(overlayBox.h) + _endDeviation,
      ),
      position: TooltipPosition.leftCenter,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _leftEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - arrowBox.w).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - overlayBox.h + _startDeviation,
      ),
      position: TooltipPosition.leftEnd,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _rightStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance + arrowBox.h).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble() - _endDeviation,
      ),
      position: TooltipPosition.rightStart,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _rightCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - _half(arrowBox.w)).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + triggerBox.w + distance + arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - _half(overlayBox.h) + _endDeviation,
      ),
      position: TooltipPosition.rightCenter,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ToolTipElementsDisplay _rightEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: triggerBox.y + _half(triggerBox.h) - arrowBox.w,
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + triggerBox.w + distance + arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - overlayBox.h + _startDeviation,
      ),
      position: TooltipPosition.rightEnd,
      radius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  double _half(double size) {
    return size * 0.5;
  }

  bool _fitsScreen(ToolTipElementsDisplay el) {
    if (el.bubble.x > 0 &&
        el.bubble.x + el.bubble.w < screenSize.w &&
        el.bubble.y > 0 &&
        el.bubble.y + el.bubble.h < screenSize.h) {
      return true;
    }
    return false;
  }

  /// Calculates each possible position until it finds one that fits.
  ToolTipElementsDisplay _firstAvailablePosition() {
    final List<ToolTipElementsDisplay Function()> positions = [
      _topCenter,
      _bottomCenter,
      _leftCenter,
      _rightCenter,
      _topStart,
      _topEnd,
      _leftStart,
      _rightStart,
      _leftEnd,
      _rightEnd,
      _bottomStart,
      _bottomEnd,
    ];
    for (final position in positions) {
      if (_fitsScreen(position())) return position();
    }
    return _topCenter();
  }

  /// Load the calculated tooltip position
  ToolTipElementsDisplay load({TooltipPosition? preferredPosition}) {
    ToolTipElementsDisplay elementPosition;

    switch (preferredPosition) {
      case TooltipPosition.topStart:
        elementPosition = _topStart();
      case TooltipPosition.topCenter:
        elementPosition = _topCenter();
      case TooltipPosition.topEnd:
        elementPosition = _topEnd();
      case TooltipPosition.bottomStart:
        elementPosition = _bottomStart();
      case TooltipPosition.bottomCenter:
        elementPosition = _bottomCenter();
      case TooltipPosition.bottomEnd:
        elementPosition = _bottomEnd();
      case TooltipPosition.leftStart:
        elementPosition = _leftStart();
      case TooltipPosition.leftCenter:
        elementPosition = _leftCenter();
      case TooltipPosition.leftEnd:
        elementPosition = _leftEnd();
      case TooltipPosition.rightStart:
        elementPosition = _rightStart();
      case TooltipPosition.rightCenter:
        elementPosition = _rightCenter();
      case TooltipPosition.rightEnd:
        elementPosition = _rightEnd();
      default:
        elementPosition = _topCenter();
        break;
    }

    return autoFitScreen
        ? _fitsScreen(elementPosition)
            ? elementPosition
            : _firstAvailablePosition()
        : elementPosition;
  }
}
