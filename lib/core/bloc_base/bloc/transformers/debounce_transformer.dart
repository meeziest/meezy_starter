import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';

EventTransformer<Event> debounceTransformer<Event>({
  Duration duration = const Duration(milliseconds: 300),
}) {
  return (events, mapper) {
    return events.debounceTime(duration).switchMap(mapper);
  };
}
