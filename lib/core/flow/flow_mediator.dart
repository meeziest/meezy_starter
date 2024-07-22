import 'dart:async';

import 'package:flutter/cupertino.dart';

typedef MediatorBuilder = FlowMediator Function(BuildContext context);

mixin FlowWrapper on StatefulWidget {
  Widget wrapped(BuildContext context);
}

mixin FlowMediator<T extends StatefulWidget> on State<T> {
  final List<StreamSubscription<dynamic>> _subs = [];

  List<StreamSubscription<dynamic>> stateSyncSubs();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    handleFlow();
  }

  @override
  void dispose() {
    detachFromFlow();
    super.dispose();
  }

  void handleFlow() {
    // Check if the current route is active
    final isCurrentRoute = ModalRoute.of(context)?.isCurrent ?? false;

    // Handle subscription state
    isCurrentRoute ? attachToFlow() : detachFromFlow();
  }

  void attachToFlow() {
    if (_subs.isEmpty) _subs.addAll(stateSyncSubs());
  }

  Future<void> detachFromFlow() async {
    final subsCancelerStream = Stream.fromIterable(_subs.map((e) => e.cancel));
    await for (final cancelStep in subsCancelerStream) {
      await cancelStep();
    }
    _subs.clear();
  }
}
