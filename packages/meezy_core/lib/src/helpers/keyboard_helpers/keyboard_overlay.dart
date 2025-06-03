import 'dart:io';

import 'package:flutter/cupertino.dart';

class KeyboardOverlay {
  static OverlayEntry? _overlayEntry;

  static void showOverlay(BuildContext context, Widget overlayWidget) {
    if (_overlayEntry != null) return;

    final OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        right: 0.0,
        left: 0.0,
        bottom: context.keyBoardHeight,
        child: overlayWidget,
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  static void removeOverlay() {
    if (_overlayEntry == null) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

extension KeyboardHeightFromContextExtension on BuildContext {
  double get keyBoardHeight => MediaQuery.of(this).viewInsets.bottom;

  double get bottomInsetWithToolBar =>
      keyBoardHeight > 0 ? keyBoardHeight + (Platform.isIOS ? 50 : 0) : 0;

  double get toolbarHeight =>
      keyBoardHeight > 0 ? (Platform.isIOS ? 50 : 0) : 0;
}
