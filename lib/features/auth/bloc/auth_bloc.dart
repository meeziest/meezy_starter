import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meezy_starter/core/helpers/streams_helper/stream_subs_cancel.dart';

import '../../../core/auth/interceptors/auth_interceptor.dart';
import '../../../core/bloc_base/bloc/base_bloc.dart';
import '../../../core/client/exceptions/failure.dart';
import '../../../core/logger/logger.dart';
import '../data/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';

/// AuthBloc
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> with SetStateMixin {
  final AuthRepository<Object> _authRepository;

  AuthBloc({
    required AuthRepository<Object> authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.idle(status: AuthenticationStatus.initial)) {
    Future<void>.delayed(const Duration(milliseconds: 500)).then((_) {
      authRepository.authStatus.map(($status) => AuthState.idle(status: $status)).listen(($state) {
        if ($state != state) {
          logger.info('Current authorization status: ${$state.status}');
          setState($state);
        }
      }).cancelableBy(this);
    });
  }

  @override
  Future<void> onEventHandler(AuthEvent event, Emitter<AuthState> emit) {
    return event.map(
      signIn: _signIn,
      signOut: _signOut,
      signUp: _signUp,
    );
  }

  Future<void> _signOut(_SignOut event) async {
    try {
      updateState(AuthState.processing(status: state.status));
      await _authRepository.signOut();
      updateState(const AuthState.idle(status: AuthenticationStatus.unauthenticated));
    } on Failure catch (e, stackTrace) {
      updateState(AuthState.error(
        status: AuthenticationStatus.unauthenticated,
        error: e,
      ));
      onError(e, stackTrace);
    }
  }

  Future<void> _signUp(_SignUp event) async {
    try {
      updateState(AuthState.processing(status: state.status));
      await _authRepository.signUp(event.email, event.password);
      await _authRepository.signIn(event.email, event.password);
      updateState(const AuthState.idle(status: AuthenticationStatus.authenticated));
    } on Failure catch (e, stackTrace) {
      updateState(AuthState.error(
        status: AuthenticationStatus.unauthenticated,
        error: e,
      ));
      onError(e, stackTrace);
    }
  }

  Future<void> _signIn(_SignIn event) async {
    try {
      updateState(AuthState.processing(status: state.status));
      await _authRepository.signIn(event.email, event.password);
      updateState(const AuthState.idle(status: AuthenticationStatus.authenticated));
    } on Failure catch (e, stackTrace) {
      updateState(AuthState.error(
        status: AuthenticationStatus.unauthenticated,
        error: e,
      ));
      onError(e, stackTrace);
    }
  }
}

@freezed
sealed class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _SignIn;

  const factory AuthEvent.signUp({
    required String email,
    required String password,
  }) = _SignUp;

  const factory AuthEvent.signOut() = _SignOut;
}

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.idle({
    required AuthenticationStatus status,
  }) = _AuthStateIdle;

  const factory AuthState.processing({
    required AuthenticationStatus status,
  }) = _AuthStateProcessing;

  const factory AuthState.error({
    required AuthenticationStatus status,
    required Failure error,
  }) = _AuthStateError;
}
