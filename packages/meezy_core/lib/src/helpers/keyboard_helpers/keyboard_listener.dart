import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class KeyboardVisibilityListener extends StatefulWidget {
  const KeyboardVisibilityListener({
    super.key,
    required this.child,
    required this.listener,
  });

  final Widget child;
  final void Function(bool visible) listener;

  @override
  State<KeyboardVisibilityListener> createState() =>
      _KeyboardVisibilityListenerState();
}

class _KeyboardVisibilityListenerState
    extends State<KeyboardVisibilityListener> {
  StreamSubscription<bool>? keyboardSubscription;

  @override
  void didChangeDependencies() {
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) async {
      widget.listener(visible);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    keyboardSubscription?.cancel();
    super.dispose();
  }
}

class KeyboardVisibilityBuilder extends StatefulWidget {
  const KeyboardVisibilityBuilder({
    super.key,
    this.listener,
    required this.builder,
  });

  final void Function(bool isKeyboardVisible)? listener;
  final Widget Function(bool isKeyboardVisible) builder;

  @override
  State<KeyboardVisibilityBuilder> createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder> {
  StreamSubscription<bool>? keyboardSubscription;
  final keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void didChangeDependencies() {
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) async {
      widget.listener?.call(visible);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: keyboardVisibilityController.onChange,
      builder: (context, snapshot) {
        final isVisible = snapshot.data ?? false;
        return AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 450,
          ),
          child: widget.builder(isVisible),
        );
      },
    );
  }

  @override
  void dispose() {
    keyboardSubscription?.cancel();
    super.dispose();
  }
}

class WhenKeyboardVisible extends StatelessWidget {
  const WhenKeyboardVisible({
    super.key,
    this.visible,
    this.invisible,
  });

  final WidgetBuilder? visible;
  final WidgetBuilder? invisible;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (isVisible) {
        if (isVisible) {
          return visible?.call(context) ?? const SizedBox.shrink();
        } else {
          return invisible?.call(context) ?? const SizedBox.shrink();
        }
      },
    );
  }
}
