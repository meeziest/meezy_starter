import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ThemeBuilder = Widget Function(BuildContext, ThemeData theme);

class SwitcherZone extends StatefulWidget {
  const SwitcherZone({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<SwitcherZone> createState() => _SwitcherZoneState();
}

class _SwitcherZoneState extends State<SwitcherZone> {
  late SwitcherController controller;

  @override
  void initState() {
    super.initState();
    controller = SwitcherController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SwitcherInheritedNotifier(
      notifier: controller,
      child: Builder(builder: (context) {
        var model = SwitcherInheritedNotifier.of(context);
        return RepaintBoundary(
          key: model.previewContainer,
          child: widget.child,
        );
      }),
    );
  }
}

class SwitcherInheritedNotifier extends InheritedNotifier<SwitcherController> {
  const SwitcherInheritedNotifier({
    super.key,
    required SwitcherController super.notifier,
    required super.child,
  });

  static SwitcherController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SwitcherInheritedNotifier>()!.notifier!;
  }

  @override
  bool updateShouldNotify(InheritedNotifier<SwitcherController> oldWidget) {
    return oldWidget.notifier?.switchToggle != notifier?.switchToggle;
  }
}

class SwitcherController extends ChangeNotifier {
  ui.Image? oldImage;

  bool switchToggle = false;

  late GlobalKey switcherGlobalKey;
  final previewContainer = GlobalKey();

  SwitcherController();

  bool isAnimating = false;

  late Offset switcherOffset;

  void makeSwitch({
    required GlobalKey key,
    Offset? offset,
    VoidCallback? onAnimationFinish,
  }) async {
    if (isAnimating) return;
    switchToggle = !switchToggle;
    isAnimating = true;
    switcherOffset = _getSwitcherCoordinates(key, offset);
    oldImage = await _makeScreenshot();
    notifyListeners();
  }

  Future<ui.Image> _makeScreenshot() async {
    final boundary = previewContainer.currentContext!.findRenderObject() as RenderRepaintBoundary;
    return await boundary.toImage();
  }

  Offset _getSwitcherCoordinates(GlobalKey<State<StatefulWidget>> switcherGlobalKey, [Offset? tapOffset]) {
    final renderObject = switcherGlobalKey.currentContext!.findRenderObject()! as RenderBox;
    final size = renderObject.size;
    return renderObject.localToGlobal(Offset.zero).translate(
          tapOffset?.dx ?? (size.width / 2),
          tapOffset?.dy ?? (size.height / 2),
        );
  }
}
