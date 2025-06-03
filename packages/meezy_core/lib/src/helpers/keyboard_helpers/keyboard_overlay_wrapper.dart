import 'package:flutter/cupertino.dart';

import 'keyboard_listener.dart';
import 'keyboard_overlay.dart';

class KeyboardOverlayWidget extends StatelessWidget {
  const KeyboardOverlayWidget({
    super.key,
    required this.child,
    required this.overlay,
  });

  final Widget child;
  final Widget overlay;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityListener(
      listener: (visible) {
        if (visible) {
          KeyboardOverlay.showOverlay(context, overlay);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      },
      child: child,
    );
  }
}
