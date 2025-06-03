import '../tooltip.dart';

abstract class Directions {
  static const up = [
    TooltipPosition.topStart,
    TooltipPosition.topCenter,
    TooltipPosition.topEnd,
  ];
  static const down = [
    TooltipPosition.bottomStart,
    TooltipPosition.bottomCenter,
    TooltipPosition.bottomEnd,
  ];
  static const right = [
    TooltipPosition.rightStart,
    TooltipPosition.rightCenter,
    TooltipPosition.rightEnd,
  ];
  static const left = [
    TooltipPosition.leftStart,
    TooltipPosition.leftCenter,
    TooltipPosition.leftEnd,
  ];
}
