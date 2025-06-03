import 'package:flutter/cupertino.dart';

import '../../../meezy_core.dart';

class ContextBinder<B extends MeezyBloc> extends StatefulWidget {
  const ContextBinder({super.key, required this.child});

  final Widget child;

  @override
  State<ContextBinder> createState() => _ContextBinderState<B>();
}

class _ContextBinderState<B extends MeezyBloc> extends State<ContextBinder> with CancelableStreamSubscriptions {
  @override
  void initState() {
    super.initState();
    context.read<B>().contextHandler.listen((handler) {
      if (mounted) handler(context);
    }).cancelableBy(this);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    cancelSubscriptions();
    super.dispose();
  }
}
