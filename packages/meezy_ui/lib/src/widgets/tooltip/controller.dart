import 'dart:async';

import 'package:flutter/material.dart';

/// Helps you to control tooltip's state
class ToolTipController extends ChangeNotifier {
  void Function(BuildContext context)? _overlayShowCallback;

  void Function()? onCLoseCallback;

  OverlayEntry? modalOverlay;
  OverlayEntry? bubbleOverlay;
  Duration animationDuration;
  bool showModal;
  bool shown;
  int timeout;
  Timer? _timer;
  bool onAnimation = false;

  ToolTipController({
    this.timeout = 0,
    this.animationDuration = const Duration(milliseconds: 350),
    this.showModal = true,
    this.onCLoseCallback,
  }) : shown = false;

  void inject(
    void Function(BuildContext context) overlayShowCallback,
  ) {
    _overlayShowCallback = overlayShowCallback;
  }

  void showOverlay(BuildContext context) {
    if (_overlayShowCallback != null) {
      _overlayShowCallback?.call(context);
    }
  }

  /// Loads the tooltip into view
  Future<void> updateAndShowOverlay(
    BuildContext context, {
    required OverlayEntry bubbleEntry,
    OverlayEntry? modalEntry,
  }) async {
    if (shown || bubbleOverlay != null) return;

    if (bubbleOverlay == null) {
      bubbleOverlay = bubbleEntry;
      Overlay.of(context).insert(bubbleOverlay!);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        shown = true;
        updateTooltip();
      });
    } else {
      shown = true;
      updateTooltip();
    }

    /// Add timeout for the tooltip to disappear after a few seconds
    if (timeout > 0) {
      if (_timer?.isActive ?? false) return;

      /// wait until animation finished
      _timer = Timer.periodic(Duration(seconds: timeout), (timer) {
        if (!shown) return;
        closeToolTip();
        timer.cancel();
        _timer = null;
      });
    }
  }

  /// hides tooltip, making it no more visible
  Future<void> closeToolTip({bool force = false}) async {
    if (onAnimation) return;

    onCLoseCallback?.call();
    shown = false;

    if (force) {
      removeBubble();
      _timer?.cancel();
    } else if (bubbleOverlay != null) {
      updateTooltip();
      _timer?.cancel();
      onAnimation = true;
      final int waitTime = (animationDuration.inMilliseconds.toDouble() * 0.8).floor();
      await Future.delayed(
        Duration(milliseconds: waitTime),
      ).then((_) => removeBubble());
    }
  }

  void removeBubble() {
    if (bubbleOverlay != null) {
      bubbleOverlay?.remove();
      bubbleOverlay = null;
      onAnimation = false;
    }
  }

  void updateTooltip() {
    if (bubbleOverlay != null && bubbleOverlay!.mounted) {
      bubbleOverlay?.markNeedsBuild();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    removeBubble();
    _timer = null;
    shown = false;
    super.dispose();
  }
}
