import 'package:flutter/material.dart';

import 'switcher_zone.dart';

typedef BuilderWithSwitcher = Widget Function(BuildContext, SwitcherController model, SwitcherCallback callback);
typedef SwitcherCallback = void Function({
  bool isReversed,
  Offset? offset,
  VoidCallback? onAnimationFinish,
});

class SwitcherPoint extends StatefulWidget {
  const SwitcherPoint({
    super.key,
    required this.builder,
  });

  final BuilderWithSwitcher builder;

  @override
  SwitcherPointState createState() => SwitcherPointState();
}

class SwitcherPointState extends State<SwitcherPoint> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Builder(
      key: _globalKey,
      builder: (context) => widget.builder(
        context,
        SwitcherInheritedNotifier.of(context),
        changeTheme,
      ),
    );
  }

  void changeTheme({
    bool isReversed = false,
    Offset? offset,
    VoidCallback? onAnimationFinish,
  }) {
    SwitcherInheritedNotifier.of(context).makeSwitch(
      key: _globalKey,
      offset: offset,
      onAnimationFinish: onAnimationFinish,
    );
  }
}
