import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../animations/sliding_bounce.dart';

typedef IconBuilder = Widget Function(Color color, double size);

class SmartDialogs {
  const SmartDialogs._();

  static Future<void> showNotify({
    Alignment alignment = Alignment.topCenter,
    String? title,
    String? subTitle,
    IconBuilder? iconBuilder,
    VoidCallback? onClose,
    List<Widget>? notificationButtons,
    TextStyle? titleTextStyle,
    Duration displayTime = const Duration(seconds: 4),
    bool clickMaskDismiss = true,
  }) async {
    SmartDialog.show(
      debounce: true,
      displayTime: displayTime,
      clickMaskDismiss: clickMaskDismiss,
      maskColor: Colors.transparent,
      animationTime: const Duration(milliseconds: 450),
      alignment: alignment,
      onDismiss: () => onClose?.call(),
      animationBuilder: (controller, child, animationParam) =>
          SlideBounceAnimation(
        controller: controller,
        alignment: animationParam.alignment,
        child: child,
      ),
      builder: (_) => SafeArea(
        child: SizedBox(),
      ),
    );
  }

  static void closeAll() => SmartDialog.dismiss();

  static Future<void> showLoading(String tag) async {
    return SmartDialog.show(
      debounce: true,
      tag: tag,
      maskColor: const Color.fromRGBO(0, 0, 0, 0.46),
      builder: (_) => const CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
    );
  }

  static Future<void> dismiss(String tag) async {
    return SmartDialog.dismiss<void>(tag: tag);
  }
}
