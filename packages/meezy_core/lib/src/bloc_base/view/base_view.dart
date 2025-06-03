import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/streams_helper/stream_subs_cancel.dart';
import '../bloc/meezy_bloc.dart';
import 'context_binder.dart';

typedef BaseBlocWidgetBuilder<B, S> = Widget Function(
  BuildContext context,
  S state,
  B bloc,
);

typedef BaseBlocWidgetListener<B, S> = dynamic Function(
  BuildContext context,
  S state,
  B bloc,
);

enum BaseBloWidgetType {
  consume,
  listen,
}

class BlocScope<B extends MeezyBloc<E, S>, E, S> extends StatelessWidget {
  const BlocScope({
    required B Function(BuildContext context) create,
    super.key,
    BaseBlocWidgetBuilder<B, S>? builder,
    this.starterEvent,
    this.listener,
    this.buildWhen,
    this.listenWhen,
  })  : child = null,
        _builder = builder,
        _create = create,
        _bloc = null,
        type = BaseBloWidgetType.consume;

  const BlocScope.value({
    required B bloc,
    super.key,
    BaseBlocWidgetBuilder<B, S>? builder,
    this.starterEvent,
    this.listener,
    this.buildWhen,
    this.listenWhen,
  })  : child = null,
        _bloc = bloc,
        _builder = builder,
        _create = null,
        type = BaseBloWidgetType.consume;

  const BlocScope.listen({
    required B Function(BuildContext context) create,
    required this.child,
    super.key,
    this.starterEvent,
    this.listener,
    this.listenWhen,
  })  : _bloc = null,
        _create = create,
        _builder = null,
        buildWhen = null,
        type = BaseBloWidgetType.listen;

  final B Function(BuildContext context)? _create;
  final B? _bloc;
  final E? starterEvent;
  final Widget? child;
  final BaseBlocWidgetBuilder<B, S>? _builder;
  final bool Function(S, S)? buildWhen;
  final BaseBlocWidgetListener<B, S>? listener;
  final bool Function(S, S)? listenWhen;
  final BaseBloWidgetType type;

  B callStarterEvent(BuildContext context) {
    assert(_bloc != null || _create != null);
    if (starterEvent == null) {
      return _bloc ?? _create!(context);
    } else {
      if (_bloc != null) {
        return _bloc..add(starterEvent as E);
      } else {
        return _create!(context)..add(starterEvent as E);
      }
    }
  }

  Widget wrappedChild(BuildContext context) => switch (type) {
        BaseBloWidgetType.consume => _BlocWrapper<B, E, S>(
            bloc: _bloc,
            buildWhen: buildWhen,
            listenWhen: listenWhen,
            listener: listener,
            builder: _builder,
          ),
        BaseBloWidgetType.listen => _BlocWrapper<B, E, S>.listen(
            listener: listener,
            listenWhen: listenWhen,
            bloc: _bloc,
            child: child,
          ),
      };

  @override
  Widget build(BuildContext context) {
    return _bloc != null
        ? BlocProvider.value(
            value: callStarterEvent(context),
            child: wrappedChild(context),
          )
        : BlocProvider(
            create: callStarterEvent,
            child: wrappedChild(context),
          );
  }
}

class _BlocWrapper<B extends MeezyBloc<E, S>, E, S> extends StatefulWidget {
  const _BlocWrapper({
    required this.builder,
    super.key,
    this.bloc,
    this.listener,
    this.buildWhen,
    this.listenWhen,
  })  : child = null,
        type = BaseBloWidgetType.consume;

  const _BlocWrapper.listen({
    required this.child,
    super.key,
    this.bloc,
    this.listener,
    this.listenWhen,
  })  : builder = null,
        buildWhen = null,
        type = BaseBloWidgetType.listen;

  final B? bloc;
  final Widget? child;
  final BaseBlocWidgetBuilder<B, S>? builder;
  final bool Function(S, S)? buildWhen;
  final BaseBlocWidgetListener<B, S>? listener;
  final bool Function(S, S)? listenWhen;
  final BaseBloWidgetType type;

  @override
  State<_BlocWrapper<B, E, S>> createState() => _BlocWrapperState<B, E, S>();
}

class _BlocWrapperState<B extends MeezyBloc<E, S>, E, S> extends State<_BlocWrapper<B, E, S>>
    with CancelableStreamSubscriptions {
  @override
  Widget build(BuildContext context) => ContextBinder<B>(
        child: switch (widget.type) {
          BaseBloWidgetType.consume => BlocConsumer<B, S>(
              buildWhen: widget.buildWhen,
              listenWhen: widget.listenWhen,
              listener: (context, state) => widget.listener?.call(
                context,
                state,
                context.read<B>(),
              ),
              builder: (context, state) => widget.builder!(
                context,
                state,
                context.read<B>(),
              ),
            ),
          BaseBloWidgetType.listen => BlocListener<B, S>(
              listener: (context, state) => widget.listener?.call(
                context,
                state,
                context.read<B>(),
              ),
              listenWhen: widget.listenWhen,
              child: widget.child,
            ),
        },
      );
}
