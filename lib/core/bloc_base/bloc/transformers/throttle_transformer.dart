import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';

Stream<E> throttleTransformer<E>(
  Stream<E> events,
  EventMapper<E> mapper, {
  int throttleTime = 100,
}) =>
    events.throttleTime(Duration(milliseconds: throttleTime)).switchMap(mapper);
