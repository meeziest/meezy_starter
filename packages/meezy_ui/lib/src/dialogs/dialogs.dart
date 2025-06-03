import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../animations/sliding_bounce.dart';

void showWidget(
  String tag,
  BuildContext context, {
  Widget? maskWidget,
  required Widget widget,
  VoidCallback? onClose,
  bool clickMaskDismiss = false,
}) async {
  SmartDialog.show<void>(
    tag: tag,
    debounce: false,
    clickMaskDismiss: clickMaskDismiss,
    alignment: Alignment.center,
    useAnimation: true,
    animationType: SmartAnimationType.fade,
    maskWidget: maskWidget,
    onDismiss: onClose,
    builder: (_) => widget,
  );
}

void showLoading(
  String tag,
  BuildContext context, {
  Widget? maskWidget,
  Widget? loaderWidget,
  Color? color,
  VoidCallback? onClose,
  bool clickMaskDismiss = true,
}) async {
  SmartDialog.show<void>(
    tag: tag,
    debounce: false,
    clickMaskDismiss: clickMaskDismiss,
    alignment: Alignment.center,
    maskWidget: maskWidget,
    onDismiss: onClose,
    builder: (_) => Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: StepRotatingShape(
                size: 25,
                rotationDuration: const Duration(milliseconds: 600), // Duration of each 45° rotation
                pauseDuration: const Duration(milliseconds: 300), // Pause duration between rotations
                color: color ?? context.colorScheme.tertiary,
              ),
            ),
            const SizedBox(height: 16),
            loaderWidget ??
                Text(
                  'Loading...',
                  style: context.textStyles.headlineSmall?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
          ],
        ),
      ],
    ),
  );
}

void dismiss(String tag) => SmartDialog.dismiss<void>(tag: tag);

Future<T?> showSmartBottomModal<T>(
  BuildContext context, {
  required String tag,
  required WidgetBuilder builder,
  bool isDismissible = true,
}) {
  return SmartDialog.show<T?>(
    tag: tag,
    alignment: Alignment.bottomCenter,
    clickMaskDismiss: isDismissible,
    builder: builder,
  );
}

const double iconSize = 28;

Future<void> showException({required ExceptionData data, String? tag}) async {
  await SmartDialog.show<dynamic>(
    tag: tag,
    debounce: true,
    displayTime: const Duration(seconds: 3),
    clickMaskDismiss: true,
    maskColor: Colors.transparent,
    animationTime: const Duration(milliseconds: 450),
    alignment: Alignment.topCenter,
    animationBuilder: (AnimationController controller, Widget child, AnimationParam animationParam) =>
        SlideBounceAnimation(
      controller: controller,
      alignment: animationParam.alignment,
      child: child,
    ),
    onDismiss: () => SmartDialog.dismiss<void>(),
    builder: (_) => SafeArea(
      child: NotificationWidget(
        title: data.title,
        subtitle: data.message,
        onClose: () => SmartDialog.dismiss<void>(),
        type: switch (data) {
          $Warning() => NotificationType.warning,
          $Info() => NotificationType.info,
          $Error() => NotificationType.error,
        },
      ),
    ),
  );
}

typedef IconBuilder = Widget Function(Color color, double size);

Future<void> showNotify(
  NotificationType type, {
  Alignment alignment = Alignment.topCenter,
  String? tag,
  String? title,
  String? subTitle,
  IconBuilder? iconBuilder,
  VoidCallback? onClose,
  TextStyle? titleTextStyle,
  Duration displayTime = const Duration(seconds: 3),
  CrossAxisAlignment popUpAlignment = CrossAxisAlignment.start,
  bool clickMaskDismiss = true,
  double? height,
  Alignment? stackAlignment,
}) async {
  SmartDialog.show<dynamic>(
    tag: tag,
    debounce: true,
    displayTime: displayTime,
    clickMaskDismiss: clickMaskDismiss,
    maskColor: Colors.transparent,
    animationTime: const Duration(milliseconds: 450),
    alignment: alignment,
    animationBuilder: (
      AnimationController controller,
      Widget child,
      AnimationParam animationParam,
    ) {
      return SlideBounceAnimation(
        controller: controller,
        alignment: animationParam.alignment,
        child: child,
      );
    },
    onDismiss: () => onClose?.call(),
    builder: (_) => SafeArea(
      child: NotificationWidget(
        onClose: onClose,
        title: title,
        subtitle: subTitle,
        type: type,
        iconBuilder: iconBuilder,
        popUpAlignment: popUpAlignment,
        titleTextStyle: titleTextStyle,
        stackAlignment: stackAlignment,
      ),
    ),
  );
}
