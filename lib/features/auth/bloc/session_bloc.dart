import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meezy_starter/core/helpers/streams_helper/stream_subs_cancel.dart';

import '../../../core/auth/interceptors/auth_interceptor.dart';
import '../../../core/bloc_base/bloc/base_bloc.dart';
import '../../../core/client/exceptions/failure.dart';
import '../../../core/logger/logger.dart';
import '../data/repositories/auth_repository.dart';

part 'session_bloc.freezed.dart';

/// AuthBloc
final class SessionBloc extends BaseBloc<SessionEvent, SessionState> with SetStateMixin {
  final SessionRepository<Object> _authRepository;

  SessionBloc({
    required SessionRepository<Object> authRepository,
  })  : _authRepository = authRepository,
        super(const SessionState.idle(status: SessionStatus.unauthenticated)) {
    Future<void>.delayed(const Duration(milliseconds: 500)).then((_) {
      authRepository.sessionStatus.map(($status) => SessionState.idle(status: $status)).listen(($state) {
        if ($state != state) {
          logger.info('Current authorization status: ${$state.status}');
          setState($state);
        }
      }).cancelableBy(this);
    });
  }

  @override
  Future<void> onEventHandler(SessionEvent event, Emitter<SessionState> emit) {
    return event.map(
      startSession: _startSession,
      endSession: _endSession,
      register: _register,
    );
  }

  Future<void> _endSession(_EndSession event) async {
    try {
      updateState(SessionState.processing(status: state.status));
      await _authRepository.signOut();
      updateState(const SessionState.idle(status: SessionStatus.unauthenticated));
    } on Failure catch (e, stackTrace) {
      updateState(SessionState.error(
        status: SessionStatus.unauthenticated,
        error: e,
      ));
      onError(e, stackTrace);
    }
  }

  Future<void> _register(_Register event) async {
    try {
      updateState(SessionState.processing(status: state.status));
      await _authRepository.signUp(event.email, event.password);
      await _authRepository.signIn(event.email, event.password);
      updateState(const SessionState.idle(status: SessionStatus.authenticated));
    } on Failure catch (e, stackTrace) {
      updateState(SessionState.error(
        status: SessionStatus.unauthenticated,
        error: e,
      ));
      onError(e, stackTrace);
    }
  }

  Future<void> _startSession(_StartSession event) async {
    try {
      updateState(SessionState.processing(status: state.status));
      await _authRepository.signIn(event.email, event.password);
      updateState(const SessionState.idle(status: SessionStatus.authenticated));
    } on Failure catch (e, stackTrace) {
      updateState(SessionState.error(
        status: SessionStatus.unauthenticated,
        error: e,
      ));
      onError(e, stackTrace);
    }
  }
}

@freezed
sealed class SessionEvent with _$SessionEvent {
  const SessionEvent._();

  const factory SessionEvent.startSession({
    required String email,
    required String password,
  }) = _StartSession;

  const factory SessionEvent.register({
    required String email,
    required String password,
  }) = _Register;

  const factory SessionEvent.endSession() = _EndSession;
}

@freezed
sealed class SessionState with _$SessionState {
  const SessionState._();

  const factory SessionState.idle({
    required SessionStatus status,
  }) = _SessionStateIdle;

  const factory SessionState.processing({
    required SessionStatus status,
  }) = _SessionStateProcessing;

  const factory SessionState.error({
    required SessionStatus status,
    required Failure error,
  }) = _SessionStateError;
}
