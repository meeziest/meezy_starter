import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/features/app/router/app_router.dart';

import '../../core/auth/interceptors/auth_interceptor.dart';
import '../auth/bloc/session_bloc.dart';

@RoutePage(name: 'SessionScopeRoute')
class SessionScope extends StatefulWidget implements AutoRouteWrapper {
  const SessionScope({super.key});

  @override
  State<SessionScope> createState() => _SessionScopeState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _SessionScopeState extends State<SessionScope> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) => AutoRouter.declarative(
        routes: (_) => [
          switch (state.status) {
            SessionStatus.unauthenticated => const AuthFlowRoute(),
            SessionStatus.authenticated => const UserScopeRoute(),
          }
        ],
      ),
    );
  }
}
