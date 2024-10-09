import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
    return AutoRouter.declarative(routes: (_) => []);
  }
}
