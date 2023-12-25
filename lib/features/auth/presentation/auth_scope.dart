import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/core/di/dependency_scope_widget.dart';
import 'package:meezy_starter/features/auth/presentation/auth_screen.dart';

import '../auth_dependencies.dart';

@RoutePage(name: 'AuthScopeRoute')
class AuthScope extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return DependenciesScope(
      dependencies: AppDependencies()..prepare(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) => AuthScreen(title: 'MeezyApp');
}
