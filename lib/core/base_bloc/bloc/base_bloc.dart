import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/core/base_bloc/view/view_action.dart';
import 'package:meezy_starter/core/helpers/when_helpers/when.dart';
import 'package:rxdart/rxdart.dart';

import '../../helpers/streams_helper/stream_subs_cancel.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S>
    with CancelableStreamSubscriptions {
  late final BehaviorSubject<ViewAction> _actionSubject;

  Stream<ViewAction> get actionHandler => _actionSubject.stream;

  Emitter<S>? _emit;
  EventTransformerType blocConcurrency = EventTransformerType.sequential;

  BaseBloc(super.initialState) {
    _actionSubject = BehaviorSubject<ViewAction>();
    on<E>(
      (event, emit) async {
        _emit = emit;
        await onEventHandler(event, emit);
        _emit = null;
      },
      transformer: _eventTransformer,
    );
  }

  EventTransformer<E> get _eventTransformer {
    return blocConcurrency.when(
      {
        EventTransformerType.sequential: () => concurrency.sequential(),
        EventTransformerType.concurrent: () => concurrency.concurrent(),
        EventTransformerType.restartable: () => concurrency.restartable(),
      },
      () => concurrency.droppable(),
    );
  }

  void handleAction<T>(ViewAction action) {
    _actionSubject.add(action);
  }

  /// Implement this instead of on<Event> if you want one events queue with
  /// sequential concurrency.
  FutureOr<void> onEventHandler(E event, Emitter<S> emit) async {}

  void updateState([S? newState]) {
    assert(
      blocConcurrency != EventTransformerType.concurrent,
      "updateState([S? newState]) doesn't work with concurrent events"
      'instead use emit directly from onEventHandler',
    );
    assert(
      _emit != null,
      'updateState([S? newState]) -> the emit function is being called before the current event has finished processing.'
      'Common EventTransformers that causes this assert -> EventTransformer.concurrent and event transformers with debouncers.'
      'The recommendation to use emit directly from an event handler (onEventHandler) instead of using updateState'
      'to ensure proper state management in such concurrent situations. By handling emit directly within the event handler,'
      'each event can update the state independently and immediately after it is processed, reducing the chance of state '
      'inconsistencies or overwrites.',
    );
    _emit?.call(newState ?? state);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('$runtimeType onError: $error');
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    _actionSubject.close();
    cancelSubscriptions();
    return super.close();
  }
}

enum EventTransformerType {
  droppable,
  sequential,
  concurrent,
  restartable,
}

abstract class Failure {
  final String? errorMsg;
  final String? errorDescription;

  Failure({
    required this.errorMsg,
    required this.errorDescription,
  });
}
