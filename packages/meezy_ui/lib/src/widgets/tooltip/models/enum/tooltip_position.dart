import 'package:flutter/cupertino.dart';

enum TooltipPosition {
  topStart,
  topCenter,
  topEnd,
  rightStart,
  rightCenter,
  rightEnd,
  bottomStart,
  bottomCenter,
  bottomEnd,
  leftStart,
  leftCenter,
  leftEnd;

  WrapCrossAlignment get wrapAlignment {
    switch (this) {
      case TooltipPosition.topStart:
        return WrapCrossAlignment.start;
      case TooltipPosition.topCenter:
        return WrapCrossAlignment.center;
      case TooltipPosition.topEnd:
        return WrapCrossAlignment.end;
      case TooltipPosition.rightStart:
        return WrapCrossAlignment.start;
      case TooltipPosition.rightCenter:
        return WrapCrossAlignment.center;
      case TooltipPosition.rightEnd:
        return WrapCrossAlignment.end;
      case TooltipPosition.bottomStart:
        return WrapCrossAlignment.start;
      case TooltipPosition.bottomCenter:
        return WrapCrossAlignment.center;
      case TooltipPosition.bottomEnd:
        return WrapCrossAlignment.end;
      case TooltipPosition.leftStart:
        return WrapCrossAlignment.start;
      case TooltipPosition.leftCenter:
        return WrapCrossAlignment.center;
      case TooltipPosition.leftEnd:
        return WrapCrossAlignment.end;
    }
  }
}
