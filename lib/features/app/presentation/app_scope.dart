import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/core/di/dependency_scope_widget.dart';
import 'package:meezy_starter/features/app/presentation/app_screen.dart';

import '../app_dependencies.dart';

@RoutePage(name: 'AppScopeRoute')
class AppScope extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return DependenciesScope(
      dependencies: AppDependencies()..prepare(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) => AppScreen(title: 'MeezyApp');
}
