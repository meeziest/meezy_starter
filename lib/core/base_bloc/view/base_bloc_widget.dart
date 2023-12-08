import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/core/base_bloc/view/view_action.dart';

import '../bloc/base_bloc.dart';

typedef BaseBlocWidgetBuilder<B, S> = Widget Function(
  BuildContext context,
  S state,
  B bloc,
);
typedef BaseBlocStateListener<B, S> = dynamic Function(
  BuildContext context,
  S state,
  B bloc,
);
typedef BaseBlocActionListener<B> = dynamic Function(
  ViewAction action,
  B bloc,
);

class BaseBlocWidget<B extends BaseBloc<E, S>, E, S> extends StatefulWidget {
  const BaseBlocWidget({
    super.key,
    required this.bloc,
    required this.builder,
    this.starterEvent,
    this.stateListener,
    this.actionListener,
    this.alreadyProvided = false,
  });

  final B bloc;
  final E? starterEvent;
  final BaseBlocWidgetBuilder<B, S> builder;
  final BaseBlocStateListener<B, S>? stateListener;
  final BaseBlocActionListener<B>? actionListener;
  final bool alreadyProvided;

  @override
  State<BaseBlocWidget<B, E, S>> createState() =>
      _BaseBlocWidgetState<B, E, S>();
}

class _BaseBlocWidgetState<B extends BaseBloc<E, S>, E, S>
    extends State<BaseBlocWidget<B, E, S>> {
  @override
  void initState() {
    if (widget.starterEvent != null && widget.alreadyProvided) {
      widget.bloc.add(widget.starterEvent as E);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.bloc.actionHandler.listen(
      (action) => widget.actionListener?.call(
        action,
        widget.bloc,
      ),
    );
    super.didChangeDependencies();
  }

  B processBloc() {
    if (widget.starterEvent != null && !widget.alreadyProvided) {
      widget.bloc.add(widget.starterEvent as E);
    }
    return widget.bloc;
  }

  Widget get child {
    return BlocConsumer<B, S>(
      listener: (context, s) =>
          widget.stateListener?.call(context, s, widget.bloc),
      builder: (context, s) => widget.builder(context, s, widget.bloc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.alreadyProvided
        ? BlocProvider.value(
            value: processBloc(),
            child: child,
          )
        : BlocProvider(
            create: (_) => processBloc(),
            child: child,
          );
  }
}
