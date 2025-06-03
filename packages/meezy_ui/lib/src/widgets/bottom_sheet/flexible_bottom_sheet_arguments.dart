import 'package:flutter/material.dart';

class FlexibleBottomSheetArguments {
  const FlexibleBottomSheetArguments({
    this.title,
    this.center,
    this.bottom,
    this.backgroundColor,
    this.onClose,
  });

  final String? title;
  final Widget Function(BuildContext context)? bottom;
  final Widget? center;
  final Color? backgroundColor;
  final VoidCallback? onClose;
}
